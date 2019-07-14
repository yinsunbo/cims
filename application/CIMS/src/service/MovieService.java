package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Media;
import entity.Movie;
import entity.Page;
import mapper.MediaMapper;
import mapper.MovieMapper;

@Service
public class MovieService {
	
	@Resource
	MovieMapper movieMapper;
	
	public List<Movie> getMovie(){
		return movieMapper.getMovie();
	}
	public int countMovie() {
		return movieMapper.countMovie();
	}
	public List<Movie> moviePage(Page page){
		return movieMapper.moviePage(page);
	}
	
	public int addMovie(Movie movie) {
		// TODO Auto-generated method stub
		return movieMapper.addMovie(movie);
	}
	
	public boolean deleteMovie(int movie_id) {
		return movieMapper.deleteMovie(movie_id)==1;
	}
	
	public Movie findMovie(int movie_id) {
		return movieMapper.findMovie(movie_id);
	}
	
	public boolean updateMovie(Movie movie) {
		return movieMapper.updateMovie(movie)==1;
	}
	
	public List<Movie> selectMovie(){
		return movieMapper.selectMovie();
	}
    public List<Movie> getMovieType(int type_id) {
        // TODO Auto-generated method stub
        return movieMapper.getMovieType(type_id);
    }
    public List<Movie> searchMovie(String movie_name) {
        // TODO Auto-generated method stub
        movie_name = "%"+movie_name+"%";
        return movieMapper.searchMovie(movie_name);
    }
}
