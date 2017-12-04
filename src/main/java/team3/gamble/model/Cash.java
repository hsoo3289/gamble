package team3.gamble.model;

import java.sql.Date;

public class Cash {
	private int history;
	private int money;
	private int charing;
	private Date chardate;
	private long seq;
	
	public Cash(){}

	public Cash(int history, int money, int charing, Date chardate, long seq) {
		super();
		this.history = history;
		this.money = money;
		this.charing = charing;
		this.chardate = chardate;
		this.seq = seq;
	}
	
	public int getHistory() {
		return history;
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
	public long getSeq() {
		return seq;
	}
	public void setHistory(int history) {
		this.history = history;
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
	public void setSeq(long seq) {
		this.seq = seq;
	}
}
