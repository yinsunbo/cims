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

import com.sun.swing.internal.plaf.metal.resources.metal;

import entity.Movie;
import entity.Scene;
import entity.Seat;
import entity.UserCinema;
import service.MovieService;
import service.SceneService;
import service.SeatService;

@Controller
public class SceneAction {
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	SceneService sceneService;
	
	@Autowired
	SeatService seatService;
	
	@RequestMapping("/scene")
	public ModelAndView sceneList() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Scene> scenes = sceneService.sceneList();
		model.put("Scenes", scenes);
		return new ModelAndView("scene",model);
	}
	
	@RequestMapping("/scene/addScene")
	public ModelAndView addView() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Movie> movies=movieService.selectMovie();
		List<Seat> seats=seatService.selectSeat();
		model.put("movies", movies);
		model.put("seats", seats);
		return new ModelAndView("addScene",model);
	}
	@RequestMapping("/scene/addSceneRequest")
	public String addScene(Scene scene) {
		try {
			sceneService.addScene(scene);
			return "redirect:/scene";
		} catch (Exception e) {
			return "redirect:/scene/addScene";
		}
		
	}
	
	@RequestMapping("/scene/{scene_id}")
	public ModelAndView findScene(@PathVariable("scene_id")int scene_id){
		Scene scene=sceneService.findScene(scene_id);
		Seat seat=seatService.findSeat(scene.getSeat_id());
		Movie movie=movieService.findMovie(scene.getMovie_id());
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("scene", scene);
		model.put("seat", seat);
		model.put("movie", movie);
		return new ModelAndView("sceneDetail",model);
	}
	
	@RequestMapping("/updateScene")
	public ModelAndView updateView(int Id) {
		Scene scene=sceneService.findScene(Id);
		Map<String, Object> model = new HashMap<String, Object>();
		List<Movie> movies=movieService.selectMovie();
		List<Seat> seats=seatService.selectSeat();
		model.put("movies", movies);
		model.put("seats", seats);
		model.put("scene", scene);
		return new ModelAndView("updateScene",model);
	}
	
	@RequestMapping("/updateSceneRequest")
	public String updateScene(Scene scene,int Id,HttpSession session) {
		try {
			scene.setScene_id(Id);
			sceneService.updateScene(scene);
			return "redirect:/updateSuccess";
		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("Id", Id);
			return "redirect:/updateFailed";
		} finally {
			session.setAttribute("entity", "scene");
			session.setAttribute("entityName", "场次");
		}
	}
	@RequestMapping("/deleteScene")
	public String deleteScene(int Id,HttpSession session) {
		try {
			sceneService.deleteScene(Id);
			return "redirect:/deleteSuccess";
			 
		} catch (Exception e) {
			return "redirect:/deleteFailed";
		} finally {
			session.setAttribute("entity", "scene");
			session.setAttribute("entityName", "场次");
		}
	}
}
