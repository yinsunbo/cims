package action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;




import entity.Movie;
import entity.Page;import entity.Type;
import service.MovieService;
import service.TypeService;



@Controller
public class MovieAction {
	
	@Autowired
	MovieService movieservice;
	
	@Autowired
	TypeService typeService;
	
	public String path = "G:\\workspace\\file\\";
	
	@RequestMapping("/movie")
	public ModelAndView moveList(HttpSession httpSession) {
		int count = movieservice.countMovie();//分页
		if(count>15) {
			if(count%15==0) {
				count=count/15;
			}else {
				count=(count/15)+1;
			}
			
			httpSession.setAttribute("countMovie",count);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		List<Movie> movies = movieservice.getMovie();
		model.put("movies", movies);
		return new ModelAndView("movie",model);
	}
	@RequestMapping("/moviePage")
	public ModelAndView moviePage(int pageId) {
		Map<String, Object> model = new HashMap<String, Object>();
		Page page=new Page(pageId);
		List<Movie> movies=movieservice.moviePage(page);
		model.put("movies", movies);
		return new ModelAndView("movie",model);
	}
	
	@RequestMapping("/cinema/addMovie")
	public ModelAndView addMovieView() {
	    Map<String,Object> model = new HashMap<String,Object>();
	    List<Type> types = typeService.getType();
	    model.put("types", types);
	    
		return new ModelAndView("addMovie",model);
	}
	
	@RequestMapping("/cinema/addMovieRequest")
	public String addMovie(@RequestParam("file") MultipartFile file,Movie movie,HttpSession session) {
	    try {
	        if(file != null) {
	            String originalFilename = file.getOriginalFilename();
	            String str = originalFilename.substring(originalFilename.lastIndexOf("."));
                
	            if(!str.equals(".jpg")&&!str.equals(".png")&&!str.equals(".jpeg")) {
	                return "redirect:/addFailed";
	            }
	            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));  
	            File newFile =  new File(path +"img\\" + newFileName);
                file.transferTo(newFile);
                movie.setImg_url("img/"+newFileName);
	        }
	        movieservice.addMovie(movie);
	        return "redirect:/addSuccess";
        } catch (Exception e) {
            System.out.println(e);
            return "redirect:/addFailed";
        }finally {
            session.setAttribute("entity", "movie");
            session.setAttribute("entityName", "电影");
        }
	}
	
	@RequestMapping("/deleteMovie")//删除
	public String deleteMedia(int Id) {
		movieservice.deleteMovie(Id);
		return "redirect:/movie";
	}
	
	@RequestMapping("/updateMovie")
	public ModelAndView updateView(int Id) {
        Map<String, Object> model=new HashMap<String, Object>();
		Movie movie=movieservice.findMovie(Id);
		List<Type> types = typeService.getType();
        model.put("types", types);
		model.put("movie", movie);
		return new ModelAndView("updateMovie",model);
	}
	
	@RequestMapping("/updateMovieRequest")
	public String updateMovie(Movie movie,int Id,@RequestParam("file") MultipartFile file) {
		movie.setMovie_id(Id);
		
		if(file !=null) {
		    File newFile=null;
		    System.out.println(movie.getImg_url());
		    if(movie.getImg_url().equals("")) {
		        String originalFilename = file.getOriginalFilename();
		        String str = originalFilename.substring(originalFilename.lastIndexOf("."));
                
                if(!str.equals(".jpg")&&!str.equals(".png")&&!str.equals(".jpeg")) {
                    return "redirect:/updateMovie?Id="+Id;
                }
		        String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));  
		        newFile =  new File(path +"img\\" + newFileName);
		        movie.setImg_url("img/"+newFileName);
		    }else {
		        newFile =  new File(path + movie.getImg_url());
            }
		    try {
                file.transferTo(newFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
		}
		if(movieservice.updateMovie(movie)) {
		   
			return "redirect:/movie";
		}else {
			return "redirect:/updateMovie?Id="+Id;
		}
	}
	
	@RequestMapping("/movie/{movie_id}")
	public ModelAndView findMovie(@PathVariable("movie_id")int movie_id) {
	    Map<String, Object> model = new HashMap<String, Object>();
	    Movie movie=movieservice.findMovie(movie_id);
		List<Type> types = typeService.getType();
		model.put("types", types);
		model.put("movie",movie);
		return new ModelAndView("movieDetail",model);
	}
}
