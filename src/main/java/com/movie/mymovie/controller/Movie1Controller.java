package com.movie.mymovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Movie1Controller {
	@RequestMapping(value="/selectPlace")
	public String selectPlace() {
		return "main/movieReservation/selectPlace";
	}
	@RequestMapping(value="/selectDateTime")
	public String selectDateTime() {
		return "main/movieReservation/selectDateTime";
	}
	@RequestMapping(value="/selectSeat")
	public String selectSeat() {
		return "main/movieReservation/selectSeat";
	}
	@RequestMapping(value="/pay")
	public String pay() {
		return "main/movieReservation/pay";
	}
	@RequestMapping(value="/reservationConfirm")
	public String reservationConfirm() {
		return "main/movieReservation/reservationConfirm";
	}
}
