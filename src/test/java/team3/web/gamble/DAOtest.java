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
import team3.gamble.model.Reply;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest.class);

	@Test
	public void testCreate() throws Exception {
		Reply reply = new Reply();
		reply.setMethod("insert");
		reply.setdbName("consulting_board_reply");

		reply.setWriter_seq(1);
		reply.setParent_seq(2);
		reply.setReply_content("aa");
		
		dao.dml(reply);
		reply.setWriter_seq(2);
		dao.dml(reply);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testDelete() throws Exception {
		Reply reply = new Reply();
		reply.setMethod("delete");
		reply.setdbName("consulting_board_reply");

		reply.setWriter_seq(1);

		dao.dml(reply);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}

	@Test
	public void testListAll() throws Exception {
		Reply reply = new Reply();
		reply.setMethod("list");
		reply.setdbName("consulting_board_reply");

		reply.setParent_seq(2);
		List<Reply> list = dao.list(reply);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void testHateCount() throws Exception {
		Reply reply = new Reply();
		reply.setMethod("hate_count");
		reply.setdbName("consulting_board_reply");

		reply.setSeq(2);
		dao.dml(reply);

		reply.setMethod("like_count");
		dao.dml(reply);

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
}
