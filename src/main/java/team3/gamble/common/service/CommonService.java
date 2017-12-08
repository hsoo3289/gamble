package team3.gamble.common.service;

import java.util.List;

import team3.gamble.model.Path;
import team3.gamble.model.Page;

public interface CommonService{
	
	<T> List<T> list(Page page, Path path, T dto);
	
	<T> List<T> list(Path path, T dto);
	
	<T> int dml(Path path, T dto);
	
	<T> T item(Path path, T dto);
	
	<T> int count(Path path, T dto);
	
	<T> long nextSeq(Path path, T dto);

}