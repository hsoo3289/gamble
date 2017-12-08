package team3.gamble.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team3.gamble.common.dao.CommonDao;
import team3.gamble.model.Path;
import team3.gamble.model.Page;

@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonDao dao;

	@Override
	public <T> List<T> list(Page page,Path path, T dto) {
		return dao.list(page, path.getNameSpace(), dto);
	}

	@Override
	public <T> List<T> list(Path path, T dto) {
		return dao.list(path.getNameSpace(), dto);
	}

	@Override
	public <T> int dml(Path path, T dto) {
		return dao.dml(path.getNameSpace(), dto);
	}

	@Override
	public <T> T item(Path path, T dto) {
		return dao.item(path.getNameSpace(), dto);
	}

	@Override
	public <T> int count(Path path, T dto) {
		return dao.count(path.getNameSpace(), dto);
	}

	@Override
	public <T> long nextSeq(Path path, T dto) {
		return dao.nextSeq(path.getNameSpace(), dto);
	}
}
