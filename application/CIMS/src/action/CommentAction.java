package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Comment;
import entity.Customer;
import entity.User;
import service.CommentService;

@Controller
public class CommentAction {
    
    @Autowired
    CommentService commentService;
    
    @RequestMapping("/home/comment")
    public ModelAndView comment(int movie_id) {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Comment> comments = commentService.getCommentList(movie_id);
        model.put("comments", comments);
        return new ModelAndView("comment",model);
    }
    @RequestMapping("/home/addComment")
    public String addComment(Comment comment,HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return "redirect:/home/login";
        }
        Map<String, Object> model = new HashMap<>();
        comment.setCustomer_id(customer.getCustomer_id());
        if(commentService.addComment(comment)) {
            return "redirect:/home/commentComplete?movie_id="+comment.getMovie_id();
        }
        return "redirect:/home/commentFailed?movie_id="+comment.getMovie_id();
    }
    
    @RequestMapping("/home/myComment")
    public ModelAndView myComment(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return new ModelAndView("redirect:/home/login");
        }
        Map<String, Object> model = new HashMap<>();
        List<Comment> comments = commentService.getMyComment(customer.getCustomer_id());
        model.put("comments", comments);
        return new ModelAndView("myComment",model);
    }
    
    @RequestMapping("/home/delComment")
    public String delComment(int comment_id,HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return "redirect:/home/login";
        }
        Comment comment = commentService.findComment(comment_id);
        if(comment.getCustomer_id() != customer.getCustomer_id()) {
            return "redirect:/home/delCommentError";
        }
        if(commentService.delComment(comment_id)) {
            return "redirect:/home/delCommentSuccess";
        }
        return "redirect:/home/delCommentError";
    }
    
    @RequestMapping("/home/adminDelComment")
    public String adminDelComment(int comment_id,HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:/login";
        }
        if(user.getPower()!=0) {
            return "redirect:/logout";
        }
        if(commentService.delComment(comment_id)) {
            return "redirect:/home/adminDelCommentSuccess";
        }
        return "redirect:/home/adminDelCommentError";
    }
}
