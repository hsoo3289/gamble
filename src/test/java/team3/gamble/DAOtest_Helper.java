package team3.gamble;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import team3.gamble.common.dao.CommonDao;
import team3.gamble.model.Helper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_Helper {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_Helper.class);
	private String dbName="CASH";

	@Test
	public void testCreate() throws Exception {
		Helper dto = new Helper();
		dto.setMethod("insert");
		dto.setDbName(dbName);
		
		dto.setMember_seq(2);
		dto.setGame_today(1);
		dto.setGame_date(new Date("2017/12/06"));
		dao.dml(dto);
		
		dto.setMember_seq(2);
		dto.setGame_date(new Date("2017/12/05"));
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testList() throws Exception {
		Helper dto = new Helper(); 
		dto.setMethod("list");
		dto.setDbName(dbName);
		dto.setMember_seq(2);
		List<Helper> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	
	@Test
	public void testDelete() throws Exception {
		Helper dto = new Helper();
		dto.setMethod("delete");
		dto.setDbName(dbName);

		dto.setSeq(2);

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}
}
