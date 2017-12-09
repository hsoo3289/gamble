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
	public <T> List<T> list(Page page, Path path, T dto){
		return sqlSession.selectList(path.getNameSpace(), page);
	}
	
	@Override
	public <T> List<T> list(Path path, T dto){
		return sqlSession.selectList(path.getNameSpace(), dto);
	}
	
	@Override
	public <T> T item(Path path, T dto) {
		return sqlSession.selectOne(path.getNameSpace(), dto);
	}
	
	@Override
	public <T> int count(Path path, T dto) {
		return sqlSession.selectOne(path.getNameSpace(), dto);
	}
	
	@Override
	public <T> long nextSeq(Path path, T dto) {
		return sqlSession.selectOne(path.getNameSpace(), dto);
	}
	
	@Override
	public <T> int dml(Path path, T dto) {
		return sqlSession.delete(path.getNameSpace(), dto);
	}
	
}
