package team3.gamble.file.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team3.gamble.dao.CommonDao;
import team3.gamble.model.FileDTO;
import team3.gamble.util.FileUtil;

@Service
public class FileService {
	@Autowired
	CommonDao dao;
	
//	public List<FileDTO> list(FileDTO dto) {
//		return dao.list(dto);
//	}

	public void insert(FileDTO dto) {
		List<MultipartFile> files = dto.getMr().getFiles("uploadfile");
		for(MultipartFile mf: files) {
			dto.setOfname(mf.getOriginalFilename());
			dto.setFname(FileUtil.upload(mf));
//			dao.dml(dto);
		}
	}
	
	public void delete(FileDTO dto) {
//		dto.setMethod("item");
//		FileDTO fileDTO = dao.item(dto);
//		FileUtil.delete(fileDTO.getFname());
//		dto.setMethod("delete");
//		dao.dml(dto);
	}
	
	public void update(FileDTO dto) {
//		dao.dml(dto);
	}

	public void download(FileDTO dto, HttpServletRequest req, HttpServletResponse res) {
//		dto.setMethod("item");
//		dto = dao.item(dto);
//		FileUtil.down(req, res, dto.getOfname(), dto.getFname());
	}

}
