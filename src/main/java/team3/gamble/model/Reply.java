package team3.gamble.model;

import java.util.Date;

public class Reply{

	private long seq;
	private long writer_seq;
	private String reply_content;
	private int hate_count;
	private int like_count;
	private long parent_seq;
	private Date cdate;

	public long getSeq() {
		return seq;
	}
	public long getWriter_seq() {
		return writer_seq;
	}
	public String getReply_content() {
		return reply_content;
	}
	public int getHate_count() {
		return hate_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public long getParent_seq() {
		return parent_seq;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setWriter_seq(int writer_seq) {
		this.writer_seq = writer_seq;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public void setHate_count(int hate_count) {
		this.hate_count = hate_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public void setParent_seq(long parent_seq) {
		this.parent_seq = parent_seq;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	
}
