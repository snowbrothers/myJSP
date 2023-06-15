package dto;

public class Criteria {

	private String searchField; // 검색조건
	private String searchWord; // 검색어
	
	int pageNo = 1; // 요청한 페이지 번호
	int amount = 10; // 한페이지당 보여질 게시물 수
	
	int startNo = 1;
	int endNo = 10;
	 
	
	public Criteria() {
		// 기본생성자로 객체 호출시 페이징 초기화.
		pageNo = 1;
		amount = 10;
		
	}
	
	
	
	
	public Criteria(int pageNo, int amount) {
		super();
		this.pageNo = pageNo;
		this.amount = amount;
	}




	public Criteria(int pageNo) {
		
		this.pageNo = pageNo;
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount -(amount-1);
		}
	}

	
	// 키워드만 넣을 경우
		public Criteria(String searchWord, String searchField) {
			this();
			this.searchWord = searchWord;
			this.searchField = searchField;
		}


	







	public Criteria(String searchField, String searchWord, int pageNo) {
		
		this.searchField = searchField;
		this.searchWord = searchWord;
		
		if(pageNo > 0) {
			this.pageNo = pageNo;
			endNo = pageNo * amount;
			startNo = pageNo * amount -(amount-1);
		}
	}


	// 전부 다 사용
	public Criteria(String searchWord, String searchField, int pageNo, int amount) {
		super();
		this.searchWord = searchWord;
		this.searchField = searchField;
		this.pageNo = pageNo;
		this.amount = amount;
	}




	// =================== get, set
	
	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}



	
	
	
	public int getStartNo() {
		return startNo;
	}




	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}



	public int getEndNo() {
		return endNo;
	}




	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}


	
	
	

}
