package team3.gamble.dao;

import java.util.List;

import team3.gamble.model.Path;
import team3.gamble.model.Page;

public interface CommonDao{
	
	public <T> List<T> list(Page page, String ns, T dto);
	
	public <T> List<T> list(String ns, T dto);
	
	public <T> T item(String ns, T dto);
	
	public <T> int count(String ns, T dto);
	
	public <T> long nextSeq(String ns, T dto);
	
	public <T> int dml(String ns, T dto);

}