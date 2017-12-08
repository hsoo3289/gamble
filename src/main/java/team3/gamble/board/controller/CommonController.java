package team3.gamble.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;
import team3.gamble.model.Path;
import team3.gamble.model.Member;

@Controller
@RequestMapping("{serviceName}/{dbName}/")
public class CommonController{
	@Autowired
	CommonService service;
	
	@RequestMapping("{view}.page")
	ModelAndView page(Path path) {
		return new ModelAndView(path.getViewPath());
	}
	
	@RequestMapping("{method}.list.{view}")
	ModelAndView list(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		return new ModelAndView(path.getViewPath(),"list",service.list(path, params));
	}
	
	@RequestMapping("{method}.item.{view}")
	ModelAndView item(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		return new ModelAndView(path.getViewPath(),"item",service.item(path, params));
	}
	
	@RequestMapping("{method}.do.{view}")
	ModelAndView dml(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		return new ModelAndView(path.getViewPath(),"result",service.dml(path, params));
	}
	
	@RequestMapping("{method}.count.{view}")
	ModelAndView count(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		service.dml(path, params);
		return new ModelAndView(path.getViewPath(),"count",service.count(path, params));
	}
	
	@RequestMapping("{method}.seq.{view}")
	ModelAndView seq(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		return new ModelAndView(path.getViewPath(),"seq",service.nextSeq(path, params));
	}
	
	@RequestMapping("login.do.{view}")
	@ResponseBody String login( HttpSession session, Path path, Member member) {
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
