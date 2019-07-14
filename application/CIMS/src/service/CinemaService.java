package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Cinema;
import entity.Page;
import mapper.CinemaMapper;

@Service
public class CinemaService {

	@Resource
	private CinemaMapper cinemaMapper;
	
	public List<Cinema> cinemaList(){
		return cinemaMapper.cinemaList();
	}
	public List<Cinema> getCinema(){
        return cinemaMapper.getCinema();
    }
	public boolean addCinema(Cinema cinema) {
		return cinemaMapper.addCinema(cinema)==1;
	}
	
	public boolean deleteCinema(int cinema_id) {
		return cinemaMapper.deleteCinema(cinema_id)==1;
	}
	
	public Cinema findCinema(int cinema_id) {
		return cinemaMapper.findCinema(cinema_id);
	}
	
	public boolean updateCinema(Cinema cinema) {
		return cinemaMapper.updateCinema(cinema)==1;
	}
	
	public int countCinema() {
		return cinemaMapper.countCinema();
	}
	public List<Cinema> cinemaPage(Page page){
		return cinemaMapper.cinemaPage(page);
	}
}
