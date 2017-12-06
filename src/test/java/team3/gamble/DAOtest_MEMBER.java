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
import team3.gamble.model.DTO;
import team3.gamble.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_MEMBER {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_MEMBER.class);
	private String dbName="member";

	@Test
	public void testCreate() throws Exception {
		Member dto = new Member();
		dto.setMethod("insert");
		dto.setDbName(dbName);

		dto.setName("aa");
		dto.setId("bb");
		dto.setPwd("adsfasdf");
		dto.setEmail("alsdjf@ladskfj.com");
		dto.setPhone("010-3636-8674");
		dto.setAccnum("654sdf.23s54sdf");
		
		dao.dml(dto);
		
		dto.setName("cc");
		dto.setId("dd");
		dto.setPwd("adsfasdf");
		dto.setEmail("alsdjf@ladskfj.com");
		dto.setPhone("010-3636-8674");
		dto.setAccnum("654sdf.23s54sdf");
		
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testListAll() throws Exception {
		Member dto = new Member();
		dto.setMethod("list");
		dto.setDbName(dbName);

		List<Member> list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void selectMember() throws Exception {
		Member dto = new Member();
		dto.setMethod("item");
		dto.setDbName(dbName);

		dto.setNo(1);
		DTO result = dao.item(dto);

		logger.info("#testListAll()");
		System.out.println("####testListAll() result:"+result.getBoardName());
	}
	
	@Test
	public void update() throws Exception {
		Member dto = new Member();
		dto.setMethod("update");
		dto.setDbName(dbName);

		dto.setNo(1);
		dto.setPwd("bbb");
		dto.setEmail("asdf@laskdjf.com");
		dto.setPhone("010-5154-2121");
		dto.setAccnum("1234");
		dao.dml(dto);
		
		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void updateMoney() throws Exception {
		Member dto = new Member();
		dto.setMethod("updatemoney");
		dto.setDbName(dbName);

		dto.setNo(2);
		dto.setMoney(1000);
	
		dao.dml(dto);
		
		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	@Test
	public void updateAuthor() throws Exception {
		Member dto = new Member();
		dto.setMethod("updateautor");
		dto.setDbName(dbName);

		dto.setNo(2);
		dto.setAuthor_level(1);
		dao.dml(dto);
		
		logger.info("#testListAll()");
		System.out.println("####testListAll()");
	}
	
	
	@Test
	public void testDelete() throws Exception {
		Member dto = new Member();
		dto.setMethod("delete");
		dto.setDbName(dbName);

		dto.setNo(1);

		dao.dml(dto);
		
		logger.info("#testDelete()");
		System.out.println("####testDelete()");
	}
}
