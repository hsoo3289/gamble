package team3.gamble;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import team3.gamble.common.dao.CommonDao;
import team3.gamble.model.AnonyBoard;
import team3.gamble.model.Board;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_Board {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_Board.class);
	private String dbName="CONSULTING_BOARD";

	@Test
	public void testCreate() throws Exception {
		Board dto = new Board();
		Board dtoforseq = (Board) new Board().setDbName(dbName).setMethod("nextseq");
		dto.setMethod("insert");
		dto.setDbName(dbName);
		
		dto.setSeq(dao.nextSeq(dtoforseq));
		dto.setSubject("aaa");
		dto.setContent("aaa");
		dto.setWriter_seq(1);
		dao.dml(dto);
		dto.setSeq(dao.nextSeq(dtoforseq));
		dao.dml(dto);
		dto.setParent_seq(2);
		dto.setSeq(dao.nextSeq(dtoforseq));
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testListAll() throws Exception {
		Board dto = new Board(); 
		dto.setMethod("list");
		dto.setDbName(dbName);

		List<Board> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void selectBoard() throws Exception {
		Board dto = new Board();
		dto.setMethod("item");
		dto.setDbName(dbName);
		dto.setNo(2);
		Board result = dao.item(dto);

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void update() throws Exception {
		Board dto = new Board();
		dto.setMethod("update");
		dto.setDbName(dbName);
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
		dto.setDbName(dbName);

		dto.setNo(1);

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}
}
