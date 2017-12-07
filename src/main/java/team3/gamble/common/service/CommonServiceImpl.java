package team3.gamble.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.gamble.common.dao.CommonDao;
import team3.gamble.model.DTO;
import team3.gamble.model.Page;

@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonDao dao;

	@Override
	public <T extends DTO> List<T> list(Page page, T dto) {
		return dao.list(page, dto);
	}

	@Override
	public <T extends DTO> List<T> list(T dto) {
		return dao.list(dto);
	}

	@Override
	public <T extends DTO> void dml(T board) {
		dao.dml(board);
	}

	@Override
	public <T extends DTO> T item(T dto) {
		return dao.item(dto);
	}

	@Override
	public <T extends DTO> int count(T dto) {
		return dao.count(dto);
	}

	@Override
	public <T extends DTO> long nextSeq(T dto) {
		return dao.nextSeq(dto);
	}
}
