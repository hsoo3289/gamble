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
import team3.gamble.model.Game;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_Game {
	private static final String dbName = "GAME";
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_Game.class);

	@Test
	public void testCreate() throws Exception {
		Game dto = new Game();
		dto.setMethod("insert");
		dto.setDbName(dbName);

		dto.setMember_seq(2);
		dto.setPlayer_remaining(1000);
		dto.setBet_amount(1000);
		dto.setThis_amount(1000);
		dto.setGame_name("aa");
		
		dao.dml(dto);
		dto.setMember_seq(2);
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testDelete() throws Exception {
		Game dto = new Game();
		dto.setMethod("delete");
		dto.setDbName(dbName);

		dto.setGame_no(1);

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}

	@Test
	public void testListAll() throws Exception {
		Game dto = new Game();
		dto.setMethod("list");
		dto.setDbName(dbName);

		dto.setMember_seq(2);
		List<Game> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
}
