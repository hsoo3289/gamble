package team3.gamble.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.board.service.BoardService;
import team3.gamble.model.Board;

@SessionAttributes("user")
@Controller
@RequestMapping("{service}/{dbName}board/")
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("{view}.page")
	ModelAndView list(@PathVariable("dbName")String dbName, 
			@PathVariable("view") String view, 
			@PathVariable("service")String service) {
		return new ModelAndView(service+"/"+dbName+"board/"+view);
		
	}
	
	@RequestMapping("boardList.do")
	ModelAndView list() {
		List<Board> list = null;
		// service.method로 결과값 매핑 필요
		return new ModelAndView("boardList", "list", list);
		
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
