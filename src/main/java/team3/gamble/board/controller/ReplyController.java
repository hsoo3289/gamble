package team3.gamble.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import team3.gamble.common.service.CommonService;

@Controller
public class ReplyController {
	@Autowired
	CommonService service;
}
