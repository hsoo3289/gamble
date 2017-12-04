package team3.gamble.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.board.service.BoardService;
import team3.gamble.model.Board;
import team3.gamble.model.Page;

@SessionAttributes("user")
@Controller
@RequestMapping("board/{BoardName}/")
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("list.do")
	ModelAndView list(Page page, Board board) {
		List<Board> list = null;
		// service.method로 결과값 매핑 필요
		return new ModelAndView("list", "list", list);
		
	}
	
	@RequestMapping("item.do")
	ModelAndView item(Board board) {
		List<Board> list = null;
		// service.method로 결과값 매핑 필요
		return new ModelAndView("list", "list", list);
		
	}
	
	@RequestMapping("insert.do")
	void insert(Board board) {
		//service.insert(board);
		
	}
	
	@RequestMapping("delete.do")
	ModelAndView delete(Board board) {
		List<Board> list = null;
		// service.method로 결과값 매핑 필요
		return new ModelAndView("list", "list", list);
		
	}
	
	@RequestMapping("update.do")
	ModelAndView list(Board board) {
		List<Board> list = null;
		// service.method로 결과값 매핑 필요
		return new ModelAndView("list", "list", list);
		
	}

}
