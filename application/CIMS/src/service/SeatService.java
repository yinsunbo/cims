package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

import entity.Page;
import entity.Seat;
import mapper.SeatMapper;

@Service
public class SeatService {
	@Resource
	SeatMapper seatMapper;
	public List<Seat> getSeat(int cinema_id){
 		return seatMapper.getSeat(cinema_id);
 	}
	public Seat findSeat(int seat_id) {
		
		return seatMapper.findSeat(seat_id);
	}
	public boolean addSeat(Seat seat) {
		return seatMapper.addSeat(seat)==1;
	}
	public boolean deleteSeat(int seat_id) {
		return seatMapper.deleteSeat(seat_id)==1;
	}
 	public boolean updateSeatMap(Seat seat) {
 		return seatMapper.updateSeatMap(seat)==1;
 	}
 	public int countSeat(int cinema_id) {
 		return seatMapper.countSeat(cinema_id);
 	}
	public List<Seat> selectSeat(){
		return seatMapper.selectSeat();
	}
	public List<Seat> seatPage(Page page){
		return seatMapper.seatPage(page);
	}
	public boolean updateSeatName(Seat seat) {
	    return seatMapper.updateSeatName(seat)==1;
	}
}
