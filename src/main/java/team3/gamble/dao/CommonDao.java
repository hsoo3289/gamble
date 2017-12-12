package team3.gamble.dao;

import java.util.List;

import team3.gamble.model.Page;
import team3.gamble.model.Path;

public interface CommonDao{
	
	public <T> List<T> list(Page page, Path path, T dto);
	
	public <T> List<T> list(Path path, T dto);
	
	public <T> T item(Path path, T dto);
	
	public <T> int count(Path path, T dto);
	
	public <T> long nextSeq(Path path, T dto);
	
	public <T> int dml(Path path, T dto);

}