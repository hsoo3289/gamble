package team3.gamble.common.dao;

import java.util.List;

import team3.gamble.model.DTO;
import team3.gamble.model.Page;

public interface CommonDao {

	<T extends DTO> List<T> list(Page page, T dto);

	<T extends DTO> T item(T dto);

	<T extends DTO> int count(T dto);

	<T extends DTO> List<T> list(T dto);

	<T extends DTO> int dml(T dto);

	<T extends DTO> long nextSeq(T dto); 

}