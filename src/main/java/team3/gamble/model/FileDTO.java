package team3.gamble.model;

import org.springframework.web.multipart.MultipartRequest;

public class FileDTO extends DTO{
	private String DTOName="file";
	long seq;
	long parent_seq;
	String fname;
	String ofname;
	private MultipartRequest mr;


	public MultipartRequest getMr() {
		return mr;
	}

	public void setMr(MultipartRequest mr) {
		this.mr = mr;
	}

	public void setDTOName(String dTOName) {
		DTOName = dTOName;
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
	@Override
	String getDTOName() {
		return this.DTOName;
	}

	public long getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(long parent_seq) {
		this.parent_seq = parent_seq;
	}
}
