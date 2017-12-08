package team3.gamble.model;

import java.util.Date;

public class Game{

	private long game_no;
	private long member_seq;
	private int player_remaining;
	private int bet_amount;
	private int this_amount;
	private String game_name;
	private Date cdate;
	
	public long getGame_no() {
		return game_no;
	}
	public long getMember_seq() {
		return member_seq;
	}
	public int getPlayer_remaining() {
		return player_remaining;
	}
	public int getBet_amount() {
		return bet_amount;
	}
	public int getThis_amount() {
		return this_amount;
	}
	public String getGame_name() {
		return game_name;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setGame_no(long game_no) {
		this.game_no = game_no;
	}
	public void setMember_seq(long member_seq) {
		this.member_seq = member_seq;
	}
	public void setPlayer_remaining(int player_remaining) {
		this.player_remaining = player_remaining;
	}
	public void setBet_amount(int bet_amount) {
		this.bet_amount = bet_amount;
	}
	public void setThis_amount(int this_amount) {
		this.this_amount = this_amount;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	
	
}