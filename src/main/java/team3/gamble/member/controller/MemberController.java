package team3.gamble.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;
import team3.gamble.model.Member;

@SessionAttributes("user")
@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private CommonService service;
	// 테스트용
	@RequestMapping("{view}.page")
	ModelAndView register(@PathVariable String view){
		return new ModelAndView("member/"+view);
	}
	
	@RequestMapping("{method}.form")
	ModelAndView form(@PathVariable String method){
		return new ModelAndView("member/"+method);
	}
	
	@RequestMapping("{method}.check")
	int check(Member member) {
		return service.count(member);
	}
	
	@RequestMapping("join.do")
	ModelAndView join(Member member){
		service.dml(member.setMethod("insert"));
		return new ModelAndView("redirect:/","user",member);
	}
	
	@RequestMapping("delete.do")
	ModelAndView delete(Member member){
		service.dml(member.setMethod("delete"));
		return new ModelAndView("redirect:/","user",new Member());
	}
	
	@RequestMapping("update.do")
	ModelAndView update(Member member) {
		service.dml(member.setMethod("update"));
		return new ModelAndView("info","user", member);
	}
	
}
