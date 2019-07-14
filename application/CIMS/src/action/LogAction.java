package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Customer;
import entity.User;
import service.CustomerService;
import service.UserService;



@Controller
public class LogAction {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/login")
	public String login(HttpSession session) {
	    User user = (User) session.getAttribute("user");
        if(user!=null) {
            return "redirect:/homepage";
        }
		return "login";
	}
	
	
	@RequestMapping("/logFailed")
	public String logFailed() {
		return "logFailed";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	@RequestMapping("/loginRequest")
	public String loginRequest(User u,HttpSession session) {
		User user=userService.login(u);
		if(user==null) {
			return "redirect:/logFailed";
		}else {
			session.setAttribute("user", user);
			return "redirect:/homepage";
		}
		
	}
	@RequestMapping("/home/login")
    public String receptionLogin(HttpSession session) {
	    Customer customer = (Customer) session.getAttribute("customer");
        if(customer!=null) {
            return "redirect:/home";
        }
        return "receptionLogin";
    }
	@RequestMapping("/home/reg")
    public String receptionReg() {
        return "receptionReg";
    }
	@RequestMapping("/home/loginRequest")
    public ModelAndView receptionLoginRequest(Customer customer,HttpSession session) {
	    Map<String, Object> model = new HashMap<String, Object>();
	    Customer customer1 = customerService.loginCustomer(customer);
	    if(customer1 != null) {
	        session.setAttribute("customer", customer1);
	        return new ModelAndView("redirect:/home");
	    }
	    model.put("customer", customer);
	    model.put("error", "手机号码或密码错误");
        return new ModelAndView("receptionLogin",model);
        
    }
	
	@RequestMapping("/home/logout")
	public String receptionLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }
	
	
	
}
