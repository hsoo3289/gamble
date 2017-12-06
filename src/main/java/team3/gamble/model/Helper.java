package team3.gamble.model;

import java.util.Date;

public class Helper extends DTO{

	@Override
	String getDTOName() {
		return "helper";
	}
	
	private long seq;
	private long member_seq;
	private Date cdate;
	private Date game_date;
	private int game_today;
	
	public long getSeq() {
		return seq;
	}
	public long getMember_seq() {
		return member_seq;
	}
	public Date getCdate() {
		return cdate;
	}
	public int getGame_today() {
		return game_today;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}
	public void setMember_seq(long member_seq) {
		this.member_seq = member_seq;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public void setGame_today(int game_today) {
		this.game_today = game_today;
	}
	public Date getGame_date() {
		return game_date;
	}
	public void setGame_date(Date game_date) {
		this.game_date = game_date;
	}
}
