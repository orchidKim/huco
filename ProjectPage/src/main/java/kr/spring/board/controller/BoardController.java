package kr.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.domain.BoardVO;
import kr.spring.board.service.BoardService;
import kr.spring.util.PagingUtil;

@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 5;
	private int pageCount = 4;

	@Resource
	private BoardService noticeService;

	//자바빈(VO) 초기화
	@ModelAttribute
	public BoardVO initCommand() {
		return new BoardVO();
	}

	//=========================사용자==========================//
	//사용자 목록
	@RequestMapping("/board/boardList.do")
	public ModelAndView process(){
									//int currentPage,@RequestParam(value="keyfield",defaultValue="")
									//String keyfield, @RequestParam(value="keyword",defaultValue="")
									//String keyword	) {
		//Map<String,Object>map = new HashMap<String,Object>();
		//map.put("keyfield", keyfield);
		//map.put("keyword", keyword);

		//게시판의 총 레코드 수 또는 레코드 수 반환
		int count = noticeService.selectRowCount();

		//페이징 처리
		//PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list.do");
		//map.put("start", page.getStartCount());
		//map.put("end", page.getEndCount());
		
		List<BoardVO> list = null;
		if(count > 0) {
			list = noticeService.selectList();
			//아이디 세팅
			for(BoardVO tmp : list) {
				tmp.setId(noticeService.findId(tmp.getMem_num()));
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		//mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}

	//사용자 글상세
	@RequestMapping("/board/boardView.do")
	public ModelAndView process (@RequestParam("n_num") int n_num) {

		//조회수 증가
		noticeService.updateHit(n_num);

		BoardVO boardVO = noticeService.selectBoard(n_num);

		return new ModelAndView("boardView","board",boardVO);
	}
	
	
	
	//=========================관리자==========================//
	
	@RequestMapping("/admin/adminBoardList.do")
	public ModelAndView processAdmin() {//@RequestParam(value="pageNum",defaultValue="1")
										//int currentPage,@RequestParam(value="keyfield",defaultValue="")
										//String keyfield, @RequestParam(value="keyword",defaultValue="")
										//String keyword	) {
		//Map<String,Object>map = new HashMap<String,Object>();
		//map.put("keyfield", keyfield);
		//map.put("keyword", keyword);

		//게시판의 총 레코드 수 또는 레코드 수 반환
		int count = noticeService.selectRowCount();

		//페이징 처리
		//PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list_admin.do");
		//map.put("start", page.getStartCount());
		//map.put("end", page.getEndCount());
		
		List<BoardVO> list = null;
		if(count > 0) {
			list = noticeService.selectList();
			//아이디 세팅
			for(BoardVO tmp : list) {
				tmp.setId(noticeService.findId(tmp.getMem_num()));
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminBoardList");
		mav.addObject("count",count);
		mav.addObject("list",list);
		//mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}
	
	//관리자 글쓰기
	@RequestMapping(value="/admin/adminBoardWrite.do", method=RequestMethod.GET)
	public String form() {
		return "adminBoardWrite";
	}

	
	//관리자 글쓰기 처리
	@RequestMapping(value="/admin/adminBoardWrite.do",method=RequestMethod.POST)
	public String submit(@Valid BoardVO noticeVO, BindingResult result, HttpServletRequest request, HttpSession session) {

		//유효성 체크 결과 에러가 있으면 폼을 호출
		if(result.hasErrors()) {
			return "adminBoardWrite";
		}
		
		//mem_num 반환
		noticeVO.setMem_num((Integer)session.getAttribute("mem_num"));
		
		//id 등록
		String id = noticeService.findId((Integer)session.getAttribute("mem_num"));

		//글 등록
		noticeService.insert(noticeVO);

		return "redirect:/admin/adminBoardList.do";
	}
	
	//글상세
	@RequestMapping("/admin/adminBoardView.do")
	public ModelAndView processAdmin (@RequestParam("num") int num) {

		//조회수 증가
		noticeService.updateHit(num);

		BoardVO notice = noticeService.selectBoard(num);

		//		                                       뷰 이름       		속성명	 속성값
		return new ModelAndView("adminBoardView" , "notice" ,notice);
	}

	//글수정 폼 호출
	@RequestMapping(value="/admin/adminBoardModify.do",method=RequestMethod.GET)
	public ModelAndView form(@RequestParam("n_num")int n_num, Model model) {
		BoardVO boardVO = noticeService.selectBoard(n_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminBoardModify");
		mav.addObject("boardVO",boardVO);

		return mav;
	}
	
	//글 수정 처리
	@RequestMapping(value="/admin/adminBoardModify.do",method=RequestMethod.POST)
	public String submitUpdate(@Valid BoardVO boardVO,BindingResult result,HttpServletRequest request) {
		//유효성체크 결과 에러가 있으면 폼 호출
		if(result.hasErrors()) {
			return "adminBoardModify";
		}
		
		noticeService.update(boardVO);

		return "redirect:/admin/adminBoardList.do";
	}

	//글 삭제
	@RequestMapping("/admin/adminBoardDelete.do")
	public String submit(@RequestParam("num") int num) {
		//글 삭제
		noticeService.delete(num);

		return "redirect:/admin/adminBoardList.do";
	}
}