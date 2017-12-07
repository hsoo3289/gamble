package team3.gamble.model;

import java.sql.Date;

public class Cash extends DTO {
	
	@Override
	String getDTOName() {
		return "cash";
	}
	
	private long seq;
	private int money;
	private int charing;
	private Date chardate;
	private long member_seq;
	private int approve;
	public long getSeq() {
		return seq;
	}
	public int getMoney() {
		return money;
	}
	public int getCharing() {
		return charing;
	}
	public Date getChardate() {
		return chardate;
	}
	public long getMember_seq() {
		return member_seq;
	}
	public int getApprove() {
		return approve;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public void setCharing(int charing) {
		this.charing = charing;
	}
	public void setChardate(Date chardate) {
		this.chardate = chardate;
	}
	public void setMember_seq(long member_seq) {
		this.member_seq = member_seq;
	}
	public void setApprove(int approve) {
		this.approve = approve;
	}
}
