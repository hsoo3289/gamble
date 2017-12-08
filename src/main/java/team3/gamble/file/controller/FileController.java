package team3.gamble.file.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;

import team3.gamble.file.service.FileService;
import team3.gamble.model.FileDTO;

@Controller
public class FileController {
	@Autowired
	FileService service;
	
	@RequestMapping("list.do")
	public void list(FileDTO dto) {
//		service.list(dto);
	}
	
	@RequestMapping("upload.do")
	public void upload(FileDTO dto, MultipartRequest mr) {
		dto.setMr(mr);
		service.insert(dto);
	}
	
	@RequestMapping("download.do")
	public void download(HttpServletRequest req, HttpServletResponse res, FileDTO dto) {
		service.download(dto, req, res);
	}
	
	@RequestMapping("delete.do")
	public void delete(FileDTO dto) {
		service.delete(dto);
	}
}
