package com.movie.mymovie.dto;

public class TheaterDto {
	private int theater_id;
	private String theater_name;
	private String theater_addr;
	
	public TheaterDto() {};
	public TheaterDto(int theater_id, String theater_name, String theater_addr) {
		super();
		this.theater_id = theater_id;
		this.theater_name = theater_name;
		this.theater_addr = theater_addr;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_addr() {
		return theater_addr;
	}
	public void setTheater_addr(String theater_addr) {
		this.theater_addr = theater_addr;
	}

	
}
