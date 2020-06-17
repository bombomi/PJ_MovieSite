package com.movie.mymovie.dto;

//import java.security.Timestamp;


public class TimeTableDto {
	private int timetable_id;
	private int theater_id;
	private String movie_id;
	private String scrhall_id;
	private String movie_dateTime;
	
	public TimeTableDto() {};
	
	public TimeTableDto(int timetable_id, int theater_id, String movie_id, String scrhall_id,
			String movie_dateTime) {
		this.timetable_id = timetable_id;
		this.theater_id = theater_id;
		this.movie_id = movie_id;
		this.scrhall_id = scrhall_id;
		this.movie_dateTime = movie_dateTime;
	}
	public int getTimetable_id() {
		return timetable_id;
	}
	public void setTimetable_id(int timetable_id) {
		this.timetable_id = timetable_id;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getScrhall_id() {
		return scrhall_id;
	}
	public void setScrhall_id(String scrhall_id) {
		this.scrhall_id = scrhall_id;
	}
	public String getMovie_dateTime() {
		return movie_dateTime;
	}
	public void setMovie_dateTime(String movie_dateTime) {
		this.movie_dateTime = movie_dateTime;
	}

	
	
	
	
}
