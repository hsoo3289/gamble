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
import team3.gamble.model.Cash;

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
		Cash dto = new Cash();
		dto.setMethod("insert");
		dto.setDbName(dbName);
		
		dto.setMoney(1000);
		dto.setCharing(100);
		dto.setMember_seq(2);
		dao.dml(dto);
		dao.dml(dto);
		dto.setMember_seq(3);
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testListAll() throws Exception {
		Cash dto = new Cash(); 
		dto.setMethod("list");
		dto.setDbName(dbName);
		dto.setMember_seq(1);
		List<Cash> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void selectItem() throws Exception {
		Cash dto = new Cash();
		dto.setMethod("item");
		dto.setDbName(dbName);
		dto.setSeq(2);
		Cash result = dao.item(dto);

		logger.info("#testListAll()");
		System.out.println("####testListAll() result:"+result.getMoney());
	}
	
	@Test
	public void testDelete() throws Exception {
		Cash dto = new Cash();
		dto.setMethod("delete");
		dto.setDbName(dbName);

		dto.setSeq(2);

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}
}
