package team3.gamble.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import team3.gamble.board.service.BoardService;

@Controller
public class ReplyController {
	@Autowired
	BoardService service;
}
