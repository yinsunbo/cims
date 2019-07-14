package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.User;
import service.OrderService;

@Controller
public class CountAction {

    @Autowired
    OrderService orderService;
    
    @RequestMapping("/count")
    public ModelAndView count(HttpSession session) {
        Map<String, Object> model = new HashMap<>();
        User user = (User) session.getAttribute("user");
        String countMoney = orderService.getCount(user.getCinema_id());
        List<String> dateCount = orderService.getCountDate(user.getCinema_id());
        
        model.put("countMoney", countMoney);
        model.put("dateCount", dateCount);
        return new ModelAndView("count",model);
        
    }
}
