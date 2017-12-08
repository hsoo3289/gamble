package team3.gamble.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;
import team3.gamble.model.Member;

@RequestMapping("member")
public class MemberController {
//	@Autowired
//	private CommonService service;
//	
//	@RequestMapping("login.do")
////	ModelAndView login( HttpSession session, @ModelAttribute Member member) {
////		member.setMethod("login");
////		Member user = service.item(member);
////		if(!user.exist()) return new ModelAndView("redirect:/");
////		if(!user.pwdcheck(member.getPwd())) return new ModelAndView("redirect:/");
////		session.removeAttribute("user");
////		session.setAttribute("user", user);
////		return new ModelAndView("redirect:/","user",user);
//	}
//	
//	@RequestMapping("logout.do")
//	ModelAndView logout(HttpSession session) {
//		session.removeAttribute("user");
//		return new ModelAndView("redirect:/");
//	}
//	
}
