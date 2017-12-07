package team3.gamble.model;

import java.sql.Date;

public class Member extends DTO {

	@Override
	String getDTOName() {
		return "member";
	}
	private long no;
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String phone;
	private String accnum;
	private int money;
	private Date joindate;
	private int author_level;
	
	public boolean exist() {
		return no!=0;
	}
	
	public boolean pwdcheck(String pwd) {
		return this.pwd.equals(pwd);
	}

	public long getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getAccnum() {
		return accnum;
	}
	public int getMoney() {
		return money;
	}
	public Date getJoindate() {
		return joindate;
	}
	public int getAuthor_level() {
		return author_level;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAccnum(String accnum) {
		this.accnum = accnum;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public void setAuthor_level(int author_level) {
		this.author_level = author_level;
	}
	
}
