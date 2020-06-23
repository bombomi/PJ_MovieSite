package com.movie.mymovie.dto;

public class ScreenHallDto {
	private String scrhallseat_id;
	private int theater_id;
	private char scrhall_seatrow;
	private int scrhall_seatcol;
	private int scrhall_id;
	
	public ScreenHallDto() {};
	
	
	public ScreenHallDto(String scrhallseat_id, int theater_id, char scrhall_seatrow, int scrhall_seatcol,
			int scrhall_id) {
		this.scrhallseat_id = scrhallseat_id;
		this.theater_id = theater_id;
		this.scrhall_seatrow = scrhall_seatrow;
		this.scrhall_seatcol = scrhall_seatcol;
		this.scrhall_id = scrhall_id;
	}
	public String getScrhallseat_id() {
		return scrhallseat_id;
	}
	public void setScrhallseat_id(String scrhallseat_id) {
		this.scrhallseat_id = scrhallseat_id;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public char getScrhall_seatrow() {
		return scrhall_seatrow;
	}
	public void setScrhall_seatrow(char scrhall_seatrow) {
		this.scrhall_seatrow = scrhall_seatrow;
	}
	public int getScrhall_seatcol() {
		return scrhall_seatcol;
	}
	public void setScrhall_seatcol(int scrhall_seatcol) {
		this.scrhall_seatcol = scrhall_seatcol;
	}
	public int getScrhall_id() {
		return scrhall_id;
	}
	public void setScrhall_id(int scrhall_id) {
		this.scrhall_id = scrhall_id;
	}
	
	
}
