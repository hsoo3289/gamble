package team3.gamble.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import team3.gamble.dao.CommonDao;
import team3.gamble.model.FileDTO;
import team3.gamble.model.Path;
import team3.gamble.util.FileUtil;

@Service
public class FileService {
	@Autowired
	CommonDao dao;

	public <T> List<T> list(Path path, T dto){
		return dao.list(path, dto);
		
	}
	
	public int insert(Path path, FileDTO dto) {
		List<MultipartFile> files = dto.getMr().getFiles("uploadfile");
		int successcount = 0;
		
		for (MultipartFile mf : files) {
			dto.setOfname(mf.getOriginalFilename());
			dto.setFname(FileUtil.upload(mf));
			successcount += dao.dml(path, dto);
		}
		return successcount;
	}

	public boolean delete(Path path, FileDTO dto) throws Exception{
		path.setMethod("item");
		FileDTO fileDTO = dao.item(path, dto);
		
		if (FileUtil.delete(fileDTO.getFname())) {
			path.setMethod("delete");
			return dao.dml(path, dto) > 0;
		}
		path.setMethod("error");
		dao.dml(path, dto);
		return false;

	}

	public boolean download(Path path, FileDTO dto, HttpServletRequest req, HttpServletResponse res) {
		path.setMethod("item");
		dto = dao.item(path, dto);
		
		return FileUtil.down(req, res, dto.getOfname(), dto.getFname());
	}

}
