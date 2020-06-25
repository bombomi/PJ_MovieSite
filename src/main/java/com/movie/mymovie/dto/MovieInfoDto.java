package com.movie.mymovie.dto;

public class MovieInfoDto {

	private String movie_id;
	private String movie_title;
	private int runtime;
	private String genre;
	private int rank;
	private String actors;
	private String nation;
	
	public MovieInfoDto() {
		
	}
	
	public MovieInfoDto(String movie_id, String movie_title, int runtime, String genre, int rank, String actors, String nation ) {
		this.movie_id =movie_id;
		this.movie_title = movie_title;
		this.runtime = runtime;
		this.genre = genre;
		this.rank = rank;
		this.actors = actors;
		this.nation = nation;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}
	
	
}
