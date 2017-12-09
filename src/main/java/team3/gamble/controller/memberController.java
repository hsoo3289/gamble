package team3.gamble.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.model.Member;
import team3.gamble.model.Path;
import team3.gamble.service.CommonService;

@Controller

public class memberController {
	@Autowired
	CommonService service;
	
	@RequestMapping("login.do.{view}")
	@ResponseBody String login(HttpSession session, Path path, Member member) {
		path.setMethod("login");
		Member user = service.item(path, member);
		if(user==null) return "id error";
		if(!user.pwdcheck(member.getPwd())) return "pwd error";
		session.removeAttribute("user");
		session.setAttribute("user", user);
		return "success";
	}
	
	@RequestMapping("logout.do.{view}")
	ModelAndView logout(HttpSession session) {
		session.removeAttribute("user");
		return new ModelAndView("redirect:/");
	}
	
}
