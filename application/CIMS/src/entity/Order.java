package entity;

public class Order {
	private int order_id;
	private String order_time;
	private String seat_location;
	private int scene_id;
	private int order_state;
	private int customer_id;
	private Integer order_price;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getSeat_location() {
		return seat_location;
	}
	public void setSeat_location(String seat_location) {
		this.seat_location = seat_location;
	}
	public int getScene_id() {
		return scene_id;
	}
	public void setScene_id(int scene_id) {
		this.scene_id = scene_id;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public int getCustomer_id() {
		return  customer_id;
	}
	public void setCustomer_id(int  customer_id) {
		this. customer_id =  customer_id;
	}
    public Integer getOrder_price() {
        return order_price;
    }
    public void setOrder_price(Integer order_price) {
        this.order_price = order_price;
    }
    @Override
    public String toString() {
        return "Order [order_id=" + order_id + ", order_time=" + order_time + ", seat_location=" + seat_location
                + ", scene_id=" + scene_id + ", order_state=" + order_state + ", customer_id=" + customer_id
                + ", order_price=" + order_price + "]";
    }
}
