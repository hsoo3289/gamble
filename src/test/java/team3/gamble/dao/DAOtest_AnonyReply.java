package team3.gamble.dao;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import team3.gamble.common.dao.CommonDao;
import team3.gamble.model.AnonyReply;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_AnonyReply {
	private static final String dbName = "Anonymous_board_reply";
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_AnonyReply.class);

	@Test
	public void testCreate() throws Exception {
		AnonyReply dto = new AnonyReply();
		dto.setMethod("insert");
		dto.setDbName(dbName);

		dto.setName("aa");
		dto.setPwd("aa");
		dto.setParent_seq(2);
		dto.setReply_content("aa");
		
		dao.dml(dto);
		dto.setName("bb");
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testDelete() throws Exception {
		AnonyReply dto = new AnonyReply();
		dto.setMethod("delete");
		dto.setDbName(dbName);

		dto.setName("cc");

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}

	@Test
	public void testListAll() throws Exception {
		AnonyReply dto = new AnonyReply();
		dto.setMethod("list");
		dto.setDbName(dbName);

		dto.setParent_seq(2);
		List<AnonyReply> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void testHateCount() throws Exception {
		AnonyReply dto = new AnonyReply();
		dto.setMethod("hate_count");
		dto.setDbName(dbName);

		dto.setSeq(2);
		dao.dml(dto);

		dto.setMethod("like_count");
		dao.dml(dto);

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
}
