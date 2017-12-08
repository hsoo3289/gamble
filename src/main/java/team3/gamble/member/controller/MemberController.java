package team3.gamble.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;
import team3.gamble.model.Member;

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
		System.out.println("삭제로 오니?");
		service.dml(member.setMethod("delete"));
		return new ModelAndView("redirect:/","user",new Member());
	}
	
	@RequestMapping("update.do")
	ModelAndView update(Member member) {
		System.out.println("여기로 오니?");
		service.dml(member.setMethod("update"));
		return new ModelAndView("member/info","user", member);
	}
	
	@RequestMapping("login.do")
	ModelAndView login(Member member, HttpSession session) {
		member.setMethod("login");
		Member user = service.item(member);
		if(!user.exist()) return new ModelAndView("redirect:/");
		if(!user.pwdcheck(member.getPwd())) return new ModelAndView("redirect:/");
		session.removeAttribute("user");
		session.setAttribute("user", user);
		return new ModelAndView("redirect:/","user",user);
	}
	
	@RequestMapping("logout.do")
	ModelAndView logout(HttpSession session){
		session.removeAttribute("user");
		return new ModelAndView("redirect:/");
	}
	@RequestMapping("idcheck.do")
	ModelAndView idcheck(Member member){
		return null;
	}
}
