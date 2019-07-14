package action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Customer;
import service.CustomerService;

@Controller
public class CustomerAction {
    
    @Autowired
    CustomerService customerService;
    
    @RequestMapping("/home/regRequest")
    public ModelAndView regCustomer(Customer customer,HttpSession session){
        Map<String, Object> model = new HashMap<>();
        if(customerService.isPhone(customer.getCustomer_phone())) {
            customerService.regCustomer(customer);
            String phone = customer.getCustomer_phone();
            phone = phone.substring(0, 3)+"****"+phone.substring(7,11);
            customer.setCustomer_phone(phone);
            System.out.println(customer.toString());
            session.setAttribute("customer", customer);
            return new ModelAndView("redirect:/home",model);
        }
        model.put("error", "该手机号码已被注册");
        model.put("customer", customer);
        return new ModelAndView("receptionReg",model);
    }
    
    @RequestMapping("/home/customer")
    public ModelAndView myCustomer(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer==null) {
            return new ModelAndView("redirect:/home/login");
        }
        Map<String, Object> model = new HashMap<>();
        customer = customerService.findCustomer(customer.getCustomer_id());
        String phone = customer.getCustomer_phone();
        phone = phone.substring(0, 3)+"****"+phone.substring(7,11);
        customer.setCustomer_phone(phone);
        model.put("customer", customer);
        return new ModelAndView("myCustomer",model);
    }
    
    @RequestMapping("/home/updateCustomer")
    public ModelAndView updateCustomer(Customer customer,HttpSession session) {
        Map<String, Object> model = new HashMap<>();
        Customer sessionCustomer = (Customer) session.getAttribute("customer");
        if(sessionCustomer==null) {
            return new ModelAndView("redirect:/home/login");
        }
        customer.setCustomer_id(sessionCustomer.getCustomer_id());
        System.out.println(customer.toString());
        if(customerService.updateCustomer(customer)) {
            return new ModelAndView("redirect:/home/updateCustomerSuccess");
        }
        return new ModelAndView("redirect:/home/updateCustomerFailed");
    }
}
