package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Page;
import entity.Seat;
import entity.User;
import service.CinemaService;
import service.SeatService;

@Controller
public class SeatAction {
	
	@Autowired
	SeatService seatService;
	
	@Autowired
	CinemaService cinemaService;
	
	@RequestMapping("seat")
	public ModelAndView seat(HttpSession session){
		Map<String, Object> model = new HashMap<String, Object>();
		User user=(User) session.getAttribute("user");
		int countSeat = seatService.countSeat(user.getCinema_id());
		if (countSeat>10) {
			if(countSeat%10==0) {
				countSeat=countSeat/10;
			}else {
				countSeat=(countSeat/10)+1;
			}
			session.setAttribute("countSeat", countSeat);
		}
		
		List<Seat> seats = seatService.getSeat(user.getCinema_id());
		model.put("seats", seats);
		return new ModelAndView("seat",model);
	}
	@RequestMapping("/seat/seatPage")
	public ModelAndView seatPage(int pageId,HttpSession session) {
	    User user=(User) session.getAttribute("user");
		Map<String, Object> model = new HashMap<String, Object>();
		Page page=new Page(pageId,10);
		page.setId(user.getCinema_id());
		List<Seat> seats=seatService.seatPage(page);
		model.put("seats", seats);
		return new ModelAndView("seat",model);
	}
	
	@RequestMapping("/seat/addSeat")
	public String addView() {
		return "addSeat";
	}
	
	@RequestMapping("/seat/nextAddSeat")
	public ModelAndView nextAddView(int seat_row,int seat_column) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("seat_row", seat_row);
		model.put("seat_column", seat_column);
		return new ModelAndView("nextAddSeat",model);
	}
	
	@RequestMapping("/seat/addSeatRequest")
	public String addSeat(Seat seat,HttpSession session) {
		try {
			User user=(User)session.getAttribute("user");
			seat.setCinema_id(user.getCinema_id());
			seatService.addSeat(seat);
			return "redirect:/addSuccess";
		} catch (Exception e) {
			System.out.println(e);
			return "redirect:/addFailed";
		}finally {
			session.setAttribute("entity", "seat");
			session.setAttribute("entityName", "座位");
		}
	}
	
	@RequestMapping("/seat/{seat_id}")
	public ModelAndView findSeat(@PathVariable("seat_id") int seat_id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Seat seat=seatService.findSeat(seat_id);
		String cinema_name=cinemaService.findCinema(seat.getCinema_id()).getCinema_name();
		model.put("seat", seat);
		model.put("cinema_name", cinema_name);
		return new ModelAndView("seatDetail",model);
	}
	@RequestMapping("/updateSeat")
	public ModelAndView updateView(int Id) {
	    Map<String, Object> model = new HashMap<String, Object>();
	    Seat seat=seatService.findSeat(Id);
	    model.put("seat", seat);
	    return new ModelAndView("updateSeat",model);
	}
	@RequestMapping("/updateSeatName")
	public String updateSeatName(int Id,String seat_name,HttpSession session) {
	    try {
	        Seat seat=new Seat();
	        seat.setSeat_id(Id);
	        seat.setSeat_name(seat_name);
	        seatService.updateSeatName(seat);
            return "updateSuccess";
        } catch (Exception e) {
            System.out.println(e);
            return "updateFailed";
        }finally {
            session.setAttribute("entity", "seat");
            session.setAttribute("entityName", "座位");
        }
	}
	
	@RequestMapping("/updateSeatMap")
	public ModelAndView updateMapView(int Id,int seat_row,int seat_column) {
	    Map<String, Object> model = new HashMap<String, Object>();
	    Seat seat=seatService.findSeat(Id);
	    seat.setSeat_row(seat_row);
	    seat.setSeat_column(seat_column);
	    model.put("seat", seat);
	    return new ModelAndView("updateSeatMap",model);
	}
	@RequestMapping("/updateSeatMapRequest")
	public String updateSeatMap(int Id,Seat seat,HttpSession session) {
	    try {
            seat.setSeat_id(Id);
            seatService.updateSeatMap(seat);
            return "updateSuccess";
        } catch (Exception e) {
            System.out.println(e);
            return "updateFailed";
        }finally {
            session.setAttribute("entity", "seat");
            session.setAttribute("entityName", "座位");
        }
	}
	@RequestMapping("/deleteSeat")
	public String deleteSeat(int Id,HttpSession session) {
	    try {
	        seatService.deleteSeat(Id);
	        return "deleteSuccess";
	    }catch (Exception e) {
            // TODO: handle exception
	        return "deleteFailed";
        }finally {
            session.setAttribute("entity", "seat");
            session.setAttribute("entityName", "座位");
        }
	}
}
