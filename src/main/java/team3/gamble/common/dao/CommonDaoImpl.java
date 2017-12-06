package team3.gamble.common.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team3.gamble.model.DTO;
import team3.gamble.model.Page;

@Repository
public class CommonDaoImpl implements CommonDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public <T extends DTO> List<T> list(Page page, T dto){
		page.setTotalNum(sqlSession.selectOne(dto.getNsDTO()+".pagecount", page));
		return sqlSession.selectList(dto.getNameSpace(), page);
	}
	
	@Override
	public <T extends DTO> List<T> list(T dto){
		return sqlSession.selectList(dto.getNameSpace(), dto);
	}
	
	@Override
	public <T extends DTO> T item(T dto) {
		return sqlSession.selectOne(dto.getNameSpace(), dto);
	}
	
	@Override
	public <T extends DTO> int count(T dto) {
		sqlSession.update(dto.getNsDTO()+".count", dto);
		return sqlSession.selectOne(dto.getNsDTO()+".count_get", dto);
	}
	
	@Override
	public <T extends DTO> long nextSeq(T dto) {
		return sqlSession.selectOne(dto.getNameSpace(), dto);
	}
	
	@Override
	public <T extends DTO> int dml(T dto) {
		return sqlSession.delete(dto.getNameSpace(), dto);
	}
	
}
