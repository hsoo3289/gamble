package team3.gamble.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.common.service.CommonService;
import team3.gamble.model.Cash;

@SessionAttributes("user")
@Controller
@RequestMapping("cash")
public class CashController {
	@Autowired
	private CommonService service;

	@RequestMapping("cash.page")
	ModelAndView cash(){
		return new ModelAndView("cash/cash");
	}
	
	@RequestMapping("cash_approve.page")
	ModelAndView approvelist(Cash cash){
		cash.setMethod("approve_list");
		return new ModelAndView("cash/cash_approve","list",service.list(cash));
	}
	
	@RequestMapping("cash_list.page")
	ModelAndView cashList(Cash cash) {
		cash.setMember_seq(6);
		cash.setMethod("list");
		return new ModelAndView("cash/cash_list","list",service.list(cash));
	}
	
	@RequestMapping("cash.do")
	ModelAndView cash(Cash cash) {
		cash.setMember_seq(6);
		service.dml(cash.setMethod("insert"));
		cash.setMethod("list");
		return new ModelAndView("cash/cash_list","list",service.list(cash));
	}
	
	@RequestMapping("approve.do")
	ModelAndView approve(Cash cash) {
		service.dml(cash.setMethod("approve"));
		cash.setMethod("approve_list");
		return new ModelAndView("cash/cash_approve","list", service.list(cash));
	}
}
