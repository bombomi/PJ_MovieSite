package com.movie.mymovie.vo;

public class BoardVO {
	
	private int board_id;			// 원글번호
	private String user_id;			// 유저 아이디
	private String board_title;		// 글 제목
	private String board_content;	// 글 내용
	private int read_cnt;			// 조회수
	private String reg_date;		// 작성일
	private int recnt;				// 게시글 댓글 수 추가
	
	// 생성자
	public BoardVO() {
		
	}

	
	// setter, getter
	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public int getRecnt() {
		return recnt;
	}


	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	
	

}
