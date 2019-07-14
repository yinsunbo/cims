package entity;

public class Customer {
	private int customer_id;
	private String customer_name;
	private String customer_password;
	private String customer_phone;
	private String customer_email;
	@Override
    public String toString() {
        return "Customer [customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_password="
                + customer_password + ", customer_phone=" + customer_phone + ", customer_email=" + customer_email + "]";
    }
    public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_password() {
		return customer_password;
	}
	public void setCustomer_password(String customer_password) {
		this.customer_password = customer_password;
	}
	
	public String getCustomer_phone() {
        return customer_phone;
    }
    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }
    public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
}
