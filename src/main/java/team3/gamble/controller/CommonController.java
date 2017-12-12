package team3.gamble.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.model.Member;
import team3.gamble.model.Page;
import team3.gamble.model.Path;
import team3.gamble.service.CommonService;

@SessionAttributes("page")
@Controller
@RequestMapping("{serviceName}/{dbName}/")
public class CommonController{
	@Autowired
	CommonService service;
	
	@RequestMapping("{view}.page")
	ModelAndView page(Path path) {
		return new ModelAndView(path.getViewPath());
	}
	
	
	@RequestMapping("{returnMethod}.{returnType}.{view}.paging")
	ModelAndView paging(Page page, Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		page.setDbName(path.getDbName());
		ModelAndView mv = new ModelAndView(path.getViewPath());
		mv.addObject("page", page);
		if(path.dmlexist()) {
			page.setTotalNum(service.count(path, params));
			mv.addObject("page",page);
		}
		
		path.changeMode();
		return mv.addObject("list", service.list(page, path, params));
	}
	
	@RequestMapping("{returnMethod}.{returnType}.{view}")
	ModelAndView method(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		
		ModelAndView mv = new ModelAndView(path.getViewPath());
		mv.addObject("pre_param", params);
		if(path.dmlexist()) mv.addObject("result", service.dml(path, params));
		
		path.changeMode();
		switch(path.getReturnType()) {
			case "list"	: mv.addObject("list", service.list(path, params)); break;
			case "item"	: mv.addObject("item", service.item(path, params)); break;
			case "count": mv.addObject("count", service.count(path, params)); break;
			case "seq"	: mv.addObject("seq", service.nextSeq(path, params)); break;
		}
		return mv;
	}
	
	@RequestMapping("{returnMethod}.{returnType}.{view}/ajax_view")
	@ResponseBody ModelAndView ajaxView(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		
		ModelAndView mv = new ModelAndView("ajax/"+path.getView());
		if(path.dmlexist()) mv.addObject("result", service.dml(path, params));
		
		path.changeMode();
		mv.addObject("list", service.list(path, params));
		return mv;
	}
	
	@RequestMapping("{returnMethod}.{returnType}.ajax")
	@ResponseBody String ajax(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		if(path.dmlexist()) service.dml(path, params);
		path.changeMode();
		return String.valueOf(service.count(path, params));
	}
	
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
