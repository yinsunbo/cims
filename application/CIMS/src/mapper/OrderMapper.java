package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Order;

public interface OrderMapper {
    int addOrder(Order order);
    Order findOrder(int order_id);
    List<String> selectedSeat(int scene_id);
    List<Order> getOrder(int customer_id);
    int payOrder(int order_id);
    List<Order> sceneFind(int scene_id);
    String getCount(int cinema_id);
    String getCountDate(@Param("cinema_id")int cinema_id, @Param("date")String date);
}
