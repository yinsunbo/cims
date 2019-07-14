package action;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Cinema;
import entity.Page;
import entity.User;
import entity.UserCinema;
import service.UserService;

@Controller
public class UserAction {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user")
	public ModelAndView userList(HttpSession httpSession) {
		int count=userService.count();
		Page page = new Page(1);
		if(count%page.getSize()==0) {
			count=count/page.getSize();
		}else {
			count=(count/page.getSize())+1;
		}
		httpSession.setAttribute("countUser", count);
		List<UserCinema> Users = userService.userList();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("Users", Users);
		return new ModelAndView("user",model);
	}
	@RequestMapping("/userPage")
	public ModelAndView userPage(int pageId) {
		Page page = new Page(pageId);
		List<UserCinema> Users = userService.userPage(page);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("Users", Users);
		return new ModelAndView("user",model);
	}
	
	@RequestMapping("/user/{noId}")
	public ModelAndView findUser(@PathVariable("noId")int noId){
		UserCinema userCinema = userService.findUser(noId);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", userCinema);
		return new ModelAndView("userDetail",model);
	}
	
	@RequestMapping("/user/addUser")
	public ModelAndView addUser() {
		List<Cinema> cinemas=userService.addUserCinema();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("cinemas", cinemas);
		return new ModelAndView("addUser",model);
		
	}
	
	@RequestMapping("/user/addUserRequest")
	public String add(User user) {
		if(userService.addUser(user)) {
			return "redirect:/user";
		}else {
			return "redirect:/user/addUser";
		}
		
		
	}
	@RequestMapping("updateUser")
	public ModelAndView updateUser(int Id) {
		List<Cinema> cinemas=userService.addUserCinema();
		UserCinema userCinema = userService.findUser(Id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", userCinema);
		model.put("cinemas", cinemas);
		return new ModelAndView("updateUser",model);
	}
	
	@RequestMapping("/deleteUser")
	public String delete(int Id) {
		if(userService.deleteUser(Id)) {
			return "redirect:/deleteUserSuccess";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/deleteUserSuccess")
	public String deleteUserSuccess() {
		return "deleteUserSuccess";
	}
	@RequestMapping("/deleteUserFailed")
	public String deleteUserFailed() {
		return "deleteUserFailed";
	}
	
	@RequestMapping("updateUserRequest")
	public String updateRequest(User user,int Id,HttpSession session) {
	    try {
	        user.setNoId(Id);
	        userService.updateUser(user);
	        return "updateSuccess";
        } catch (Exception e) {
            System.out.println(e);
            return "updateFailed";
        } finally {
            session.setAttribute("entity", "user");
            session.setAttribute("entityName", "用户");
        }
	}
	
	
}
