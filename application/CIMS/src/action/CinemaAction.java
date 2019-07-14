package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Cinema;
import entity.Page;
import service.CinemaService;

@Controller
public class CinemaAction {
	
	@Autowired
	private CinemaService cinemaService;
	
	@RequestMapping("/cinema")
	public ModelAndView cinemaList(HttpSession httpSession) {
		int countCinema = cinemaService.countCinema();//分页
		if(countCinema>10) {
			if(countCinema%10==0) {
				countCinema=countCinema/10;
			}else {
				countCinema=(countCinema/10)+1;
			}
			httpSession.setAttribute("countCinema",countCinema);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<Cinema> cinemas=cinemaService.cinemaList();
		model.put("Cinemas", cinemas);
		return new ModelAndView("cinema",model);
	}
	@RequestMapping("/cinema/cinemaPage")
	public ModelAndView cinemaPage(int pageId) {
		Page page = new Page(pageId,10);
		Map<String, Object> model = new HashMap<String, Object>();
		List<Cinema> cinemas=cinemaService.cinemaPage(page);
		model.put("Cinemas", cinemas);
		
		return new ModelAndView("cinema",model);
		
	}
	
	@RequestMapping("/cinema/addCinema")
	public String addView() {
		return "addCinema";
	}
	
	@RequestMapping("/cinema/addCinemaRequest")
	public String addCinema(Cinema cinema) {
		if(cinemaService.addCinema(cinema)) {
			
			return "redirect:/cinema";
		}else {
			return "redirect:/cinema/addCinemaRequest";
		}
		
	}
	
	@RequestMapping("/deleteCinema")
	public String delete(int Id,HttpSession Session) {
		try {
			cinemaService.deleteCinema(Id);
			return "deleteCinemaSuccess";
		} catch (Exception e) {
			return "deleteCinemaFailed";
		}
	}
	
	@RequestMapping("/updateCinema")
	public ModelAndView update(int Id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Cinema cinema=cinemaService.findCinema(Id);
		model.put("cinema", cinema);
		return new ModelAndView("updateCinema",model);
	}
	
	@RequestMapping("/updateCinemaRequest")
	public String updateCinema(Cinema cinema,int Id,HttpSession session) {
		cinema.setCinema_id(Id);
		try {
			cinemaService.updateCinema(cinema);
			session.setAttribute("entity","cinema");
			return "redirect:/cinema";
		} catch (Exception e) {
			return "redirect:/updateCinema?Id="+Id;
		}
	}
	
	@RequestMapping("/cinema/{cinema_id}")
	public ModelAndView findCinema(@PathVariable("cinema_id")int cinema_id) {
		Cinema cinema=cinemaService.findCinema(cinema_id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cinema", cinema);
		return new ModelAndView("cinemaDetail",model);
	}
}
