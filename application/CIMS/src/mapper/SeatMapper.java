package mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import entity.Page;
import entity.Seat;

public interface SeatMapper {
	List<Seat> getSeat(int cinema_id);
	Seat findSeat(int seat_id);
	int addSeat(Seat seat);
	int deleteSeat(int seat_id);
	int updateSeatMap(Seat seat);
	int countSeat(int cinema_id);	
	List<Seat> selectSeat();
	List<Seat> seatPage(Page page);
	int updateSeatName(Seat seat);
}
