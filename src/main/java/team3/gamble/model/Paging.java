package team3.gamble.model;

public class Paging {

	private String title;
	private String regdate;
	
	public Paging() {}
	public Paging(String title) {
		super();
		this.title = title;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "Paging [title=" + title + ", regdate=" + regdate + "]";
	}
	
}
