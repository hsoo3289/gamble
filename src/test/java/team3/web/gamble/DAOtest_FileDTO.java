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
import team3.gamble.model.FileDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DAOtest_FileDTO {
	// @Resource(name="addrDao")
	@Inject
	private CommonDao dao;
	private static Logger logger = LoggerFactory.getLogger(DAOtest_FileDTO.class);
	private String dbName="CONSULTING_BOARD_FILE";

	@Test
	public void testCreate() throws Exception {
		FileDTO dto = new FileDTO();
		dto.setMethod("insert");
		dto.setdbName(dbName);
		dto.setOfname("file");
		dto.setFname("file(1)");
		dto.setParent_seq(2);
		dao.dml(dto);
		dao.dml(dto);
		dto.setParent_seq(3);
		dao.dml(dto);
		
		logger.info("#testCreate()");
		System.out.println("####testCreate()");
	}

	@Test
	public void testListAll() throws Exception {
		FileDTO dto = new FileDTO();
		dto.setMethod("list");
		dto.setdbName(dbName);
		dto.setParent_seq(2);
		
		List list = dao.list(dto);
		System.out.println("list.size(): " + list.size());

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
