package team3.web.gamble;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import team3.gamble.common.dao.CommonDao;
import team3.gamble.model.Board;
import team3.gamble.model.DTO;
import team3.gamble.model.Member;

import static org.mockito.Mockito.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_Cash {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_Cash.class);
	private String dbName="CASH";

	@Test
	public void testCreate() throws Exception {
		Board dto = new Board();
		dto.setMethod("insert");
		dto.setdbName(dbName);
		
		dto.setSubject("aaa");
		dto.setContent("aaa");
		dto.setWriter_seq(1);
		dao.dml(dto);
		dao.dml(dto);
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testListAll() throws Exception {
		Board dto = new Board(); 
		dto.setMethod("list");
		dto.setdbName(dbName);

		List<Board> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void selectBoard() throws Exception {
		Board dto = new Board();
		dto.setMethod("item");
		dto.setdbName(dbName);
		dto.setNo(2);
		Board result = dao.item(dto);

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void update() throws Exception {
		Board dto = new Board();
		dto.setMethod("update");
		dto.setdbName(dbName);
		dto.setSubject("bb");
		dto.setContent("bb");
		dto.setSeq(2);

		dao.dml(dto);
		
		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void testDelete() throws Exception {
		Board dto = new Board();
		dto.setMethod("delete");
		dto.setdbName(dbName);

		dto.setNo(1);

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}
}
