package dto;

public class Board {

	private String num; // 일련번호
	private String title; // 제목
	private String content; // 내용
	private	String id; // 아이디
	private String postdate; // 작성일
	private String visitcount; // 방문수
	
	
	public Board(String num, String title, String content, String id, String postdate, String visitcount) {
	
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postdate = postdate;
		this.visitcount = visitcount;
	}


	public Board() {
		// TODO Auto-generated constructor stub
	}

	
	
	@Override
	public String toString() {
		String str = "";
		
		return getNum() +" "+ getTitle() +" "+ getContent() + " " + getId() 
			+ " "+ getPostdate() + " "+ getVisitcount() ;
	}
	
	// ------------- get, set

	public String getNum() {
		return num;
	}


	public void setNum(String num) {
		this.num = num;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPostdate() {
		return postdate;
	}


	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}


	public String getVisitcount() {
		return visitcount;
	}


	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	
}
