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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.Response;
import com.sun.javafx.sg.prism.NGShape.Mode;

import entity.Cinema;
import entity.Comment;
import entity.Customer;
import entity.Movie;
import entity.Order;
import entity.Page;
import entity.Scene;
import entity.Seat;
import entity.Type;
import service.CinemaService;
import service.CommentService;
import service.MovieService;
import service.OrderService;
import service.SceneService;
import service.SeatService;
import service.TypeService;



@Controller
public class HomeAction {
	
    @Autowired
    private TypeService typeService;
    
    @Autowired
    private MovieService movieService;
    
    @Autowired
    private SceneService sceneService;
    
    @Autowired
    private CinemaService cinemaService;
    
    @Autowired
    private SeatService seatService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CommentService commentService;
    @RequestMapping("/home")
    public ModelAndView reception(HttpSession session) {
        int count = movieService.countMovie();//分页
        if(count>15) {
            if(count%15==0) {
                count=count/15;
            }else {
                count=(count/15)+1;
            }
            session.setAttribute("countMovie",count);
        }
        Map<String, Object> model = new HashMap<String, Object>();
        List<Type> types = typeService.getType();
        List<Movie> movies = movieService.getMovie();
        model.put("movies", movies);
        session.setAttribute("types", types);
        return new ModelAndView("reception",model);
    }
    
    @RequestMapping("/home/{page_id}")
    public ModelAndView reception(@PathVariable("page_id") int page_id) {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Type> types = typeService.getType();
        Page page=new Page(page_id);
        List<Movie> movies=movieService.moviePage(page);
        model.put("movies", movies);
        return new ModelAndView("reception",model);
    }
	@RequestMapping("/homepage")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/home/showMovie/{movie_id}")
	public ModelAndView showMovie(@PathVariable("movie_id") int movie_id) {
	    Map<String, Object> model = new HashMap<>();
	    Movie movie = movieService.findMovie(movie_id);
	    List<Scene> scenes = sceneService.movieFindDate(movie_id);
	    List<Cinema> cinemas = cinemaService.getCinema();
	    List<Seat> seats = seatService.selectSeat();
        List<Comment> comments = commentService.getComment(movie.getMovie_id());
	    model.put("movie", movie);
	    model.put("scenes", scenes);
	    model.put("cinemas", cinemas);
	    model.put("seats", seats);
	    model.put("comments", comments);
	    return new ModelAndView("movieIntroduce",model);
	}
	
	@RequestMapping("/home/choiceScene")
	public ModelAndView optionalSeat(int scene_id,HttpSession session) {
	    Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return new ModelAndView("redirect:/home/login");
        }
	    Map<String, Object> model = new HashMap<>();
	    String selectedSeat = orderService.selectedSeat(scene_id);
	    Scene scene = sceneService.findScene(scene_id);
	    Seat seat = seatService.findSeat(scene.getSeat_id());
	    Movie movie = movieService.findMovie(scene.getMovie_id());
	    Cinema cinema = cinemaService.findCinema(scene.getCinema_id());
	    model.put("scene",scene);
	    model.put("seat",seat);
	    model.put("movie",movie);
	    model.put("cinema", cinema);
	    model.put("selectedSeat", selectedSeat);
	    return new ModelAndView("optionalSeat",model);
	}
	
	@RequestMapping("/home/type/{type_id}")
	public ModelAndView homeType(@PathVariable("type_id") int type_id,HttpSession session) {
	    Map<String, Object> model = new HashMap<String, Object>();
        List<Movie> movies = movieService.getMovieType(type_id);
        
        model.put("movies", movies);
	    return new ModelAndView("reception",model);
	}
	
	@RequestMapping("/home/search")
	public ModelAndView searchMovie(String movie_name) {
	    Map<String, Object> model = new HashMap<String, Object>();
	    List<Movie> movies = movieService.searchMovie(movie_name);
	    model.put("movies", movies);
	    return new ModelAndView("reception",model);
	}
	
}
