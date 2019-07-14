package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Order;
import mapper.OrderMapper;

@Service
public class OrderService {
    
    @Resource
    OrderMapper orderMapper;

    public boolean addOrder(Order order) {
        
        return orderMapper.addOrder(order)==1;
    }

    public Order findOrder(int order_id) {
        
        return orderMapper.findOrder(order_id);
    }
    
    public String selectedSeat(int scene_id){
        List<String> strings=orderMapper.selectedSeat(scene_id);
        String str="";
        if (strings.size()>0) {
            for(int i=0;i<strings.size();i++) {
                if(i==0){
                    str = str+strings.get(i);
                }else {
                str = str+","+strings.get(i);
                }
            }
        }
        return str;
    }

    public List<Order> getOrder(int customer_id) {
        
        return orderMapper.getOrder(customer_id);
    }

    public boolean payOrder(int order_id) {
        // TODO Auto-generated method stub
        return orderMapper.payOrder(order_id)==1;
    }

    public List<Order> sceneFind(int scene_id) {
        // TODO Auto-generated method stub
        return orderMapper.sceneFind(scene_id);
    }

    public String getCount(int cinema_id) {
        String count = orderMapper.getCount(cinema_id);
        if(count==null) {
            count = "";
        }
        return count;
    }

    public List<String> getCountDate(int cinema_id) {
        List<String> list=new ArrayList<>();
        List<String> dateList=new ArrayList<>();
        Date date = new Date();
        SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat month = new SimpleDateFormat("yyyy-MM");
        SimpleDateFormat year = new SimpleDateFormat("yyyy-MM");
        dateList.add(day.format(date));
        dateList.add(month.format(date));
        dateList.add(year.format(date));
        for(int i=0;i<3;i++) {
            String str = orderMapper.getCountDate(cinema_id,dateList.get(i));
            if(str==null) {
                list.add("0");
            }else {
                list.add(str);
            }
        }
        return list;
    }
    
}
