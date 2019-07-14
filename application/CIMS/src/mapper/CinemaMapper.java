package mapper;

import java.util.List;

import entity.Cinema;
import entity.Page;

public interface CinemaMapper {
	List<Cinema> addUserCinema();
	List<Cinema> cinemaList();
	int addCinema(Cinema cinema);
	int deleteCinema(int cinema_id);
	Cinema findCinema(int cinema_id);
	int updateCinema(Cinema cinema);
	int countCinema();
	List<Cinema> cinemaPage(Page page);
	List<Cinema> getCinema();
}
