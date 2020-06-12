package com.movie.mymovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Movie1Controller {
	@RequestMapping(value="/movieInfo")
	public String selectMovieInfo() {
		return "main/movieInfo";
	}
	@RequestMapping(value="/selectPlace")
	public String selectPlace() {
		return "movieReservation/selectPlace";
	}
	@RequestMapping(value="/selectDateTime")
	public String selectDateTime() {
		return "movieReservation/selectDateTime";
	}
	@RequestMapping(value="/selectSeat")
	public String selectSeat() {
		return "movieReservation/selectSeat";
	}
	@RequestMapping(value="/pay")
	public String pay() {
		return "movieReservation/pay";
	}
	@RequestMapping(value="/reservationConfirm")
	public String reservationConfirm() {
		return "movieReservation/reservationConfirm";
	}
	@RequestMapping(value="/headerCheck")
	public String headerCheck() {
		return "header";
	}
	
}
