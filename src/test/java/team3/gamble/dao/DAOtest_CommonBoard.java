package team3.gamble.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import team3.gamble.dao.CommonDao;
import team3.gamble.model.Helper;
import team3.gamble.model.Path;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_CommonBoard {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_CommonBoard.class);
	private String dbName="consulting_board";
	private String serviceName="consulting";
	private Path path = new Path();

	/**
	 * @throws Exception
	 */
	/**
	 * @throws Exception
	 */
	@Test
	public void testCreate() throws Exception {
		path.setServiceName(serviceName);
		path.setDbName(dbName);
		path.setMethod("insert");
		
		HashMap<String, Object> dto = new HashMap<String, Object>();
		
		dto.put("dbName",dbName);
		dto.put("seq", 8);
		dto.put("subject", "bbb");
		dto.put("content", "ccc");
		dto.put("writer_seq", 3);
		dao.dml(path, dto);
		
		dto.put("seq", 9);
		dto.put("parent_seq", 3);
		dao.dml(path, dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	/**
	 * @throws Exception
	 */
//	@Test
//	public void testList() throws Exception {
//		path.setServiceName(serviceName);
//		path.setDbName(dbName);
//		path.setMethod("list");
//		
//		HashMap<String, Object> dto = new HashMap<String, Object>();
//		dto.put("member_seq", 2);
//		List<HashMap<String, Object>> list = dao.list(path, dto);
//		System.out.println("list.size(): " + list.size());
//
//		logger.info("#testListAll()");
//		System.out.println("####testListAll()");
//	}
//	
//	
//	@Test
//	public void testDelete() throws Exception {
//		path.setServiceName(serviceName);
//		path.setDbName(dbName);
//		path.setMethod("delete");
//
//		
//		HashMap<String, Object> dto = new HashMap<String, Object>();
//		dto.put("seq", 3);
//
//		dao.dml(path, dto);
//		
//		logger.info("#testDelete()");
//		System.out.println("####testDelete()");
//	}
}
