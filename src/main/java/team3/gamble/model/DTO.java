package team3.gamble.model;

import org.springframework.web.bind.annotation.PathVariable;

abstract public class DTO {
	private static final String ns = "team3.gamble.mybatis.";
	private String boardName;
	private String dbName;
	private String method;
	
	abstract String getDTOName();
	public static String getNs() {
		return ns;
	}

	public String getBoardName() {
		return boardName;
	}

	public String getMethod() {
		return method;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	
	public void setdbName(@PathVariable("dbName")String dbName) {
		this.dbName = dbName;
		
	}
	
	public DTO setMethod(@PathVariable("method")String method) {
		this.method = method;
		return this;
		
	}
	
	public String getNameSpace() {
		System.out.println(ns+boardName+"."+method);
		return ns+getDTOName()+"."+method;
	}
	
	public String getDbName() {
		return dbName;
	}
	
	public String getNsDTO() {
		return ns+getDTOName();
	}
}
