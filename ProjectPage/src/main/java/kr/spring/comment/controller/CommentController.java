package kr.spring.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.comment.domain.CommentVO;
import kr.spring.comment.service.CommentService;
import kr.spring.util.PagingUtil;

@Controller
public class CommentController {
	@Resource
	private CommentService commentService;
	
	private int rowCount = 10;
	private int pageCount = 10;

	@ModelAttribute
	public CommentVO initCommand() {
		return new CommentVO();
	}

	//댓글  입력(submit) 후 등록 처리
	@RequestMapping(value="/comment/writeComment.do",method=RequestMethod.POST)
	public String commentInsert(CommentVO commentVO){
		commentVO.setId(commentService.findId(commentVO.getMem_num()));
		commentService.insertComment(commentVO);

		return "redirect:/forest/forestDetail.do?p_num="+commentVO.getP_num();
	}

	//관리자 페이지 진입 후, 전체 댓글 리스트 추출
	@RequestMapping("/admin/adminCommentList.do")
	public ModelAndView adminForestList(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="keyfield",defaultValue="") String keyfield,
			@RequestParam(value="keyword",defaultValue="") String keyword) {
		
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int count = commentService.selectRowCount(map);
				
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"adminCommentList.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<CommentVO> commentList = null;
		
		if(count > 0) {
			commentList = commentService.commentList(map);
		}

		//회원번호를 통한 아이디 세팅
		if(count > 0) {
			for(CommentVO commentVO : commentList) {
				commentVO.setId(commentService.findId(commentVO.getMem_num()));
			}
		}
		

		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminCommentList");
		mav.addObject("count",count);
		mav.addObject("commentList",commentList);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}

	//관리자의 댓글 삭제 처리, 삭제 후 관리자 댓글 리스트로 이동
	@RequestMapping(value="/admin/commentDeleteAdmin.do",method=RequestMethod.GET)
	public String commentDeleteAdmin(@RequestParam("c_num") int c_num) {

		commentService.deleteComment(c_num);

		return "redirect:/admin/adminCommentList.do";
	}

	//회원의 댓글 삭제 처리, 삭제 후 이전 페이지로 이동
	@RequestMapping(value="/comment/commentDeleteUser.do",method=RequestMethod.GET)
	public String commentDeleteUser(@RequestParam("c_num") int c_num,
										@RequestParam("p_num") int p_num) {

		commentService.deleteComment(c_num);
		return "redirect:/forest/forestDetail.do?p_num="+p_num;
	}



}
