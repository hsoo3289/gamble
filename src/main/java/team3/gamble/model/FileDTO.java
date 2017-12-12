package team3.gamble.model;

import org.springframework.web.multipart.MultipartRequest;

public class FileDTO{
	private String dbName; 
	private long seq;
	private long parent_seq;
	private String fname;
	private String ofname;
	private MultipartRequest mr;
	private String error;


	public MultipartRequest getMr() {
		return mr;
	}

	public void setMr(MultipartRequest mr) {
		this.mr = mr;
	}
	
	public long getSeq() {
		return seq;
	}

	public String getFname() {
		return fname;
	}
	public String getOfname() {
		return ofname;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	public void setOfname(String ofname) {
		this.ofname = ofname;
	}

	public long getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(long parent_seq) {
		this.parent_seq = parent_seq;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
}
