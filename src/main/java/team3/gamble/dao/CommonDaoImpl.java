package team3.gamble.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team3.gamble.model.Path;
import team3.gamble.model.Page;

@Repository
public class CommonDaoImpl implements CommonDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public <T> List<T> list(Page page, String ns, T dto){
		return sqlSession.selectList(ns, page);
	}
	
	@Override
	public <T> List<T> list(String ns, T dto){
		return sqlSession.selectList(ns, dto);
	}
	
	@Override
	public <T> T item(String ns, T dto) {
		return sqlSession.selectOne(ns, dto);
	}
	
	@Override
	public <T> int count(String ns, T dto) {
		return sqlSession.selectOne(ns, dto);
	}
	
	@Override
	public <T> long nextSeq(String ns, T dto) {
		return sqlSession.selectOne(ns, dto);
	}
	
	@Override
	public <T> int dml(String ns, T dto) {
		return sqlSession.delete(ns, dto);
	}
	
}
