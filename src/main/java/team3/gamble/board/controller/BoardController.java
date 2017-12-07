package team3.gamble.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;
import team3.gamble.model.Board;

@Controller
@RequestMapping("{serviceName}/consultingboard/")
public class BoardController {
	@Autowired
	CommonService service;
	
	@RequestMapping("{view}.page")
	ModelAndView list(@PathVariable("dbName")String dbName, 
			@PathVariable("view") String view, 
			@PathVariable("serviceName")String serviceName) {
		return new ModelAndView(serviceName+"/"+dbName+"board/"+view);
		
	}
	
	@RequestMapping("list.do")
	ModelAndView list(Board board, 
			@PathVariable("serviceName")String serviceName) {
		board.setDbName("consulting_board_view");
		board.setMethod("list");
		List<Board> list = service.list(board);
		String uri = serviceName+"consulting/consultingboard/list";
		return new ModelAndView(uri, "list", list);
		
	}
	
	@RequestMapping("item.do")
	ModelAndView item(Board board,
			@PathVariable("serviceName")String serviceName) {
		board.setMethod("item");
		board.setDbName("consultingboard_board_view");
		Board item = service.item(board);
		String uri = serviceName+"consulting/list";
		return new ModelAndView(uri, "item", item);
		
	}
	
	@RequestMapping("insert.do")
	ModelAndView insert(Board board,
			@PathVariable("serviceName")String serviceName) {
		board.setDbName("consulting_board");
		board.setMethod("insert");
		service.dml(board);
		String uri = "redirect:"+serviceName+"consulting/list";
		return new ModelAndView(uri);
	}
	
	@RequestMapping("delete.do")
	ModelAndView delete(Board board,
			@PathVariable("serviceName")String serviceName) {
		board.setDbName("consultingboard");
		List<Board> list = null;
		String uri = "redirect:"+serviceName+"consulting/list";
		return new ModelAndView(uri);
		
	}
	
	@RequestMapping("update.do")
	ModelAndView update(Board board,
			@PathVariable("serviceName")String serviceName) {
		board.setDbName("consulting_board");
		List<Board> list = null;
		String uri = "redirect:"+serviceName+"consulting/list";
		return new ModelAndView(uri);
		
	}

}
