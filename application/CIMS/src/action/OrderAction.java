package action;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Customer;
import entity.Movie;
import entity.Order;
import entity.Scene;
import entity.User;
import service.CustomerService;
import service.MovieService;
import service.OrderService;
import service.SceneService;
import service.TypeService;

@Controller
public class OrderAction {
    
    @Autowired
    OrderService orderService;
    @Autowired
    SceneService sceneService;
    @Autowired
    MovieService movieService;
    @Autowired
    TypeService typeService;
    @Autowired
    CustomerService customerService;
    @RequestMapping("/home/addOrder")
    public ModelAndView addOrder(Order order,HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return new ModelAndView("redirect:/home/login");
        }
        Map<String, Object> model = new HashMap<>();
        if(order.getOrder_price()==null) {
            return new ModelAndView("redirect:/home/choiceScene?scene_id="+order.getScene_id()+"&error=1");
        }
        order.setCustomer_id(customer.getCustomer_id());
        if(orderService.addOrder(order)) {
            return new ModelAndView("redirect:/home/pay?order_id="+order.getOrder_id());
        }
        return new ModelAndView("redirect:/home/choiceScene");
    }
    
    @RequestMapping("/home/pay")
    public ModelAndView pay(int order_id,HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return new ModelAndView("redirect:/home/login");
        }
        Map<String, Object> model = new HashMap<>();
        Order order = orderService.findOrder(order_id);
        if(customer.getCustomer_id()!=order.getCustomer_id()) {
            return new ModelAndView("redirect:/home/errorOrder");
        }
        Scene scene = sceneService.findScene(order.getScene_id());
        Movie movie = movieService.findMovie(scene.getMovie_id());
        model.put("order", order);
        model.put("scene", scene);
        model.put("movie", movie);
        return new ModelAndView("pay",model);
    }
    @RequestMapping("/home/payOrder")
    public ModelAndView payOrder(int order_id) {
        if (orderService.payOrder(order_id)) {
            return new ModelAndView("redirect:/home/payOrderSuccess");
        }
        return new ModelAndView("redirect:/home/payOrderFailed");
    }
    @RequestMapping("/home/errorOrder")
    public ModelAndView errorOrder() {
        
        return new ModelAndView("errorOrder");
    }
    
    @RequestMapping("/home/order")
    public ModelAndView myOrder(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return new ModelAndView("redirect:/home/login");
        }
        Map<String, Object> model = new HashMap<>();
        List<Order> orders = orderService.getOrder(customer.getCustomer_id());
        
        model.put("orders",orders);
        return new ModelAndView("myOrder",model);
    }
    @RequestMapping("/home/payOrderSuccess")
    public ModelAndView payOrderSuccess() {
        return new ModelAndView("payOrderSuccess");
    }
    @RequestMapping("/order")
    public ModelAndView order(HttpSession session) {
        Map<String, Object> model = new HashMap<>();
        User user = (User) session.getAttribute("user");
        List<Order> orders = new ArrayList<>();
        int[] idList = sceneService.cinemaFind(user.getCinema_id());
        for(int i=0;i<idList.length;i++) {
            List<Order> temp = orderService.sceneFind(idList[i]);
            if(temp!=null) {
                orders.addAll(temp);
            }
            
        }
        model.put("orders", orders);
        return new ModelAndView("order",model);
    }
    @RequestMapping("/order/{order_id}")
    public ModelAndView orderDetail(@PathVariable("order_id") int order_id) {
        Map<String, Object> model = new HashMap<>();
        Order order = orderService.findOrder(order_id);
        Scene scene = sceneService.findScene(order.getScene_id());
        Customer customer = customerService.findCustomer(order.getCustomer_id());
        String customerName = customer.getCustomer_name();
        model.put("order", order);
        model.put("scene", scene);
        model.put("customerName", customerName);
        return new ModelAndView("orderDetail",model);
    }
}
