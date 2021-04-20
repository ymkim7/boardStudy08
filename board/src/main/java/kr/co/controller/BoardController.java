package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private final static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	//게시글 목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", service.list(scri));
		
		return "board/list";
	}
	
	//게시판 글 작성 화면
	@RequestMapping(value = "writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("writeView");
	}
	
	//게시판 글 작성
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/board/list";
	}
	
	//게시판 조회
	@RequestMapping(value = "readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model
			, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/readView";
	}
	
	//게시판 글 수정 화면
	@RequestMapping(value = "updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model
			, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/updateView";
	}
	
	//게시판 글 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, RedirectAttributes rttr
			, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("update");
		
		service.update(boardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//게시판 글 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, RedirectAttributes rttr
			, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
}
