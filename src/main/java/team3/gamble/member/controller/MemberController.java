package team3.gamble.member.controller;

import java.lang.reflect.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.member.service.MemberService;

@SessionAttributes("user")
@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("register.do")
	ModelAndView register(Member member){
		//service.method();
		return new ModelAndView("/", "user", member);
	}
	
	@RequestMapping("login.do")
	ModelAndView login(Member member) {
		//service.method();
		return new ModelAndView("/","user", member);
	}
	
	@RequestMapping("item.do")
	ModelAndView item(Member member) {
		//service.method();
		return new ModelAndView("/","item", member);
	}
	
	@RequestMapping("cash.do")
	ModelAndView cash(Member member) {
		//service.method();
		return new ModelAndView("/");
	}
	
	@RequestMapping("update.do")
	ModelAndView update(Member member){
		//service.method();
		return new ModelAndView("/");
	}
	
	@RequestMapping("delete.do")
	ModelAndView delete(Member member){
		//service.method();
		return new ModelAndView("/");
	}
}
