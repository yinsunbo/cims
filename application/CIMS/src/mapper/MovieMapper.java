package mapper;

import java.util.List;

import entity.Media;
import entity.Movie;
import entity.Page;

public interface MovieMapper {
	List<Movie> getMovie();
	int countMovie();
	List<Movie> moviePage(Page page);
	int addMovie(Movie movie);
	int deleteMovie(int movie_id);
	Movie findMovie(int movie_id);
	int updateMovie(Movie movie);
	List<Movie> selectMovie();
    List<Movie> getMovieType(int type_id);
    List<Movie> searchMovie(String movie_name);
}
