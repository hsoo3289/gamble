package team3.gamble.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import team3.gamble.model.FileDTO;
import team3.gamble.model.Path;
import team3.gamble.service.FileService;

@Controller
@RequestMapping("file/{serviceName}/{dbName}")
public class FileController {
	@Autowired
	FileService service;
	
	
	@RequestMapping("{returnMethod}.{returnType}.{view}/ajax_view")
	@ResponseBody ModelAndView ajaxView(Path path, @RequestParam Map<String, Object> params) {
		params.put("dbName", path.getDbName());
		
		ModelAndView mv = new ModelAndView("ajax/"+path.getView());
		
//		path.changeMode();
		mv.addObject("path",path);
		mv.addObject("list", service.list(path, params));
		return mv;
	}
	
	@RequestMapping("upload.do")
	@ResponseBody int upload(Path path, FileDTO dto, MultipartRequest mr) {
		path.setMethod("upload");
		dto.setDbName(path.getDbName());
		dto.setMr(mr);
		return service.insert(path, dto);
	}
	
	@RequestMapping("download.do")
	@ResponseBody public boolean download(Path path, FileDTO dto, 
		HttpServletRequest req, HttpServletResponse res) {
		dto.setDbName(path.getDbName());
		return service.download(path, dto, req, res);
	}
	
	@RequestMapping("delete.do")
	@ResponseBody public boolean delete(Path path, FileDTO dto) throws Exception{
		path.setMethod("delete");
		dto.setDbName(path.getDbName());
		return service.delete(path, dto);
	}
}
