package team3.gamble.model;

import java.util.Date;

public class Board extends Member{

	private long seq;
	private String subject;
	private String content;
	private long writer_seq;
	private int view_conunt;
	private int like_conunt;
	private Date cdate;
	private Date rdate;
	private long parent_seq;
	
	public long getSeq() {
		return seq;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public long getWriter_seq() {
		return writer_seq;
	}
	public int getView_conunt() {
		return view_conunt;
	}
	public int getLike_conunt() {
		return like_conunt;
	}
	public Date getCdate() {
		return cdate;
	}
	public Date getRdate() {
		return rdate;
	}
	public long getParent_seq() {
		return parent_seq;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriter_seq(long writer_seq) {
		this.writer_seq = writer_seq;
	}
	public void setView_conunt(int view_conunt) {
		this.view_conunt = view_conunt;
	}
	public void setLike_conunt(int like_conunt) {
		this.like_conunt = like_conunt;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public void setParent_seq(long parent_seq) {
		this.parent_seq = parent_seq;
	}
}
