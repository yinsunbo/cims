package mapper;

import entity.Customer;

public interface CustomerMapper {
    int regCustomer(Customer customer);
    int isPhone(String customer_phone);
    Customer loginCustomer(Customer customer);
    Customer findCustomer(int customer_id);
    int updateCustomer(Customer customer);
}
