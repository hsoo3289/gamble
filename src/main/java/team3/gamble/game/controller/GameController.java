package team3.gamble.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;

@Controller
@RequestMapping("game")
public class GameController {
	@Autowired
	CommonService service;
	
	@RequestMapping("{view}.page")
	ModelAndView list(@PathVariable("view") String view) {
		return new ModelAndView("game/"+view);
		
	}
	
}
