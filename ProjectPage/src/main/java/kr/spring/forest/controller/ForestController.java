package kr.spring.forest.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.comment.domain.CommentVO;
import kr.spring.comment.service.CommentService;
import kr.spring.forest.domain.ForestVO;
import kr.spring.forest.service.ForestService;

@Controller
public class ForestController {
	@Resource
	private ForestService forestService;

	@Resource
	private CommentService commentService;

	//프로젝트 경로 변경시 매번 수정
	String path = "C:\\Users\\user\\Desktop\\projectPage\\ForestPage\\src\\main\\webapp\\upload";

	@ModelAttribute
	public ForestVO initCommand() {
		return new ForestVO();
	}

	//사용자 시점의 휴양림 리스트 출력
	@RequestMapping(value="/forest/forestList.do",method=RequestMethod.GET)
	public ModelAndView forestList(@RequestParam(value="location",required=false) String location) {

		List<ForestVO> forestList = null;
		int count = 0;

		//특정 지역(location) 선택x -> 전국 휴양림 출력 
		if(location == null) {
			count = forestService.allForestListCount();
			forestList = forestService.allForestList();
		}else {
			//특정 지역(location) 선택 -> 해당 지역 휴양림만 출력 
			count = forestService.selectForestListCount(location);
			//해당 지역의 휴양림이 존재하는 경우
			if(count>0) {
				forestList = forestService.selectForestList(location);
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("forestList");
		mav.addObject("forestList",forestList);
		mav.addObject("location",location);
		mav.addObject("count",count);

		return mav;
	}

	//특정 휴양림 선택 후, 휴양림 상세 페이지
	@RequestMapping("/forest/forestDetail.do")
	public ModelAndView forestDetail(@RequestParam(value="p_num", required=true) int p_num, HttpSession session) {
		//선택 휴양림 고유번호를 통한 휴양림 데이터 추출
		ForestVO forest = forestService.selectForest(p_num);

		int commentCnt = commentService.selectCommentListCount(p_num);
		List<CommentVO> commentList = commentService.selectCommentList(p_num);

		//회원번호를 통한 아이디 세팅
		for(CommentVO commentVO : commentList) {
			commentVO.setId(commentService.findId(commentVO.getMem_num()));
		}



		ModelAndView mav = new ModelAndView();
		mav.setViewName("forestDetail");
		mav.addObject("forest",forest);
		mav.addObject("commentCnt",commentCnt);
		mav.addObject("commentList",commentList);

		//세션에서 회원고유번호 추출
		int mem_num = 0;
		if(session.getAttribute("mem_num") != null) {
			mem_num = (Integer)session.getAttribute("mem_num");
			mav.addObject("mem_num",mem_num);
		}
		

		return mav;
	}


	//관리자 페이지 진입
	@RequestMapping("/admin/adminList.do")
	public ModelAndView adminList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminList");
		return mav;
	}

	//관리자 페이지 진입 후, 전체 휴양림 리스트 추출
	@RequestMapping("/admin/adminForestList.do")
	public ModelAndView adminForestList() {

		int count = forestService.allForestListCount();
		List<ForestVO> forestList = forestService.allForestList();		

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminForestList");
		mav.addObject("forestList",forestList);
		mav.addObject("count",count);

		return mav;
	}

	//관리자 페이지 진입 후, 새 휴양림 등록 폼
	@RequestMapping(value="/admin/forestInsert.do",method=RequestMethod.GET)
	public String forestInsertForm() {
		return "forestInsert";
	}

	//관리자 페이지 진입 후, 새 휴양림 등록 처리
	@RequestMapping(value="/admin/forestInsert.do",method=RequestMethod.POST)
	public String forestInsertSubmit(ForestVO forestVO) throws IllegalStateException, IOException{
		File  file = null;

		//새로 등록한 휴양림에 이미지가 없는 경우
		if(forestVO.getImg_path().isEmpty()) {
			//System.out.println("등록한 파일 x");
		}else {
			//새로 등록한 휴양림에 이미지가 존재
			file = new File(path+"/"+forestVO.getImg_path().getOriginalFilename());
			forestVO.getImg_path().transferTo(file);
			forestVO.setP_img(forestVO.getImg_path().getOriginalFilename());
		}

		forestService.insertForest(forestVO);

		return "redirect:/admin/adminForestList.do";
	}

	//관리자 페이지 진입 후, 휴양림 정보 수정 폼
	@RequestMapping(value="/admin/forestUpdate.do",method=RequestMethod.GET)
	public ModelAndView forestUpdateForm(@RequestParam("p_num") int p_num) {
		ForestVO forest = forestService.selectForest(p_num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("forestUpdate");
		mav.addObject("forest",forest);

		return mav;
	}


	//관리자 페이지 진입 후, 휴양림 정보 수정 처리
	@RequestMapping(value="/admin/forestUpdate.do",method=RequestMethod.POST)
	public String forestUpdate(ForestVO forestVO) throws IllegalStateException, IOException {
		File  file = null;

		//수정한 휴양림에 이미지가 없는 경우
		if(forestVO.getImg_path().isEmpty()) {
			//System.out.println("등록한 파일 x");
		}else {
			//수정한 휴양림에 이미지가 존재
			file = new File(path+"/"+forestVO.getImg_path().getOriginalFilename());
			forestVO.getImg_path().transferTo(file);
			forestVO.setP_img(forestVO.getImg_path().getOriginalFilename());
		}

		forestService.updateForest(forestVO);

		return "redirect:/admin/adminForestList.do";
	}

	//휴양림 정보 삭제
	@RequestMapping(value="/admin/forestDelete.do",method=RequestMethod.GET)
	public String forestDelete(@RequestParam("p_num") int p_num) {

		forestService.deleteForest(p_num);

		return "redirect:/admin/adminForestList.do";
	}



}
