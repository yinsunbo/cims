package action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TipsAction {
    
    @RequestMapping("/addSuccess")
    public String addSuccess() {
        return "addSuccess";
    }
    @RequestMapping("/addFailed")
    public String addFailed() {
        return "addFailed";
    }
    @RequestMapping("/updateSuccess")
    public String updateSuccess() {
        return "updateSuccess";
    }
    @RequestMapping("/updateFailed")
    public String updateFailed() {
        return "updateFailed";
    }
    
    @RequestMapping("/deleteSuccess")
    public String deleteSuccess() {
        return "deleteSuccess";
    }
    @RequestMapping("/deleteFailed")
    public String deleteFailed() {
        return "deleteFailed";
    }
    @RequestMapping("/home/updateCustomerSuccess")
    public String updateCustomerSuccess() {
        return "updateCustomerSuccess";
    }
    @RequestMapping("/home/updateCustomerFailed")
    public String updateCustomerFailed() {
        return "updateCustomerFailed";
    }
    @RequestMapping("/home/commentComplete")
    public ModelAndView commentComplete(int movie_id) {
        Map<String, Object> model = new HashMap<>();
        model.put("movie_id", movie_id);
        return new ModelAndView("commentComplete",model);
    }
    @RequestMapping("/home/commentFailed")
    public ModelAndView commentFailed(int movie_id) {
        Map<String, Object> model = new HashMap<>();
        model.put("movie_id", movie_id);
        return new ModelAndView("commentFailed",model);
    }
    @RequestMapping("/home/delCommentSuccess")
    public String delCommentSuccess() {
        return "delCommentSuccess";
    }
    @RequestMapping("/home/delCommentError")
    public String delCommentError() {
        return "delCommentError";
    }
    @RequestMapping("/home/adminDelCommentSuccess")
    public ModelAndView adminDelCommentSuccess(int movie_id) {
        Map<String, Object> model = new HashMap<>();
        model.put("movie_id", movie_id);
        return new ModelAndView("adminDelCommentSuccess",model);
    }
    @RequestMapping("/home/adminDelCommentError")
    public ModelAndView adminDelCommentError(int movie_id) {
        Map<String, Object> model = new HashMap<>();
        model.put("movie_id", movie_id);
        return new ModelAndView("adminDelCommentError",model);
    }
}
