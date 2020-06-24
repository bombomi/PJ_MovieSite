package com.movie.mymovie.dto;


/*	좌석 정보를 화면에 출력할 때 쓸 함수를 정의한 클래스입니다.
 * 	movieReservation 관리 이외에 건드리지 말 것.
 * */
public class PrintSeatListOnPage {	
	static public  String printPage(int theater_id, int scrhall_id, char row, int col) {
		String scrHallSeat_id="";
		String strTheater="";
		String strScrHall="";
		String strRow="";
		String strCol="";

		
		if(theater_id<10) {
			strTheater="0"+String.valueOf(theater_id);
		}else
			strTheater=String.valueOf(theater_id);
		
		if(scrhall_id<10) {
			strScrHall="0"+String.valueOf(scrhall_id);
		}else
			strTheater=String.valueOf(theater_id);
			
		int rowInt=row-64;
		if(rowInt<10) {
			strRow="0"+String.valueOf(rowInt);
		}else
			strRow=String.valueOf(rowInt);
		
		if(col<10) {
			strCol="0"+String.valueOf(col);
		}else
			strCol=String.valueOf(col);
		
		scrHallSeat_id=strTheater+strScrHall+strRow+strCol;

		return scrHallSeat_id;
	}
	
	static public  String rowColFormat(String scrhallSeat_id) {
		String returnFormat="";

		char row=(char)(Integer.parseInt(String.valueOf(scrhallSeat_id.substring(4,6)))+64);
		String col=scrhallSeat_id.substring(6,8);
		returnFormat=String.valueOf(row)+"열 "+col+"번";
		return returnFormat;
	}
}
