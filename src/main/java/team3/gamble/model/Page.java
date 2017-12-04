package team3.gamble.model;

public class Page {
	private int page=1;
	private int pages=1;
	private int pageSize=10;
	private int totalNum=0;
	private String col;
	private String keyWord;
	private boolean searchMode=false;
	private int begin=1;
	private int end=10;
	
	private void setRange() {
		begin = (page-1)*pageSize+1;
		end = begin+pageSize-1;
	}
	
	public int getBegin() {
		return begin;
	}

	public int getEnd() {
		return end;
	}
	
	public int getCurrPage() {
		return page;
	}

	public int getPageSize() {
		return pageSize;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setPages() {
		this.pages = (totalNum-1)/pageSize+1;
	}
	
	public int getPages() {
		return pages;
	}
	public void setPage(int page) {
		this.page = page;
		setRange();
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		setRange();
		setPages();
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
		setPages();
	}
	public boolean isSearchMode() {
		return searchMode;
	}
	public void setSearchMode(boolean searchMode) {
		this.searchMode = searchMode;
	}
	public String getCol() {
		return col;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setCol(String col) {
		this.col = col;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getPage() {
		return page;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public void checkSearchMode() {
		if(keyWord==null || keyWord.equals("")) this.searchMode = false;
	}
}
