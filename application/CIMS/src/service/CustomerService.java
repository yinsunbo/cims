package service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Customer;
import mapper.CustomerMapper;

@Service
public class CustomerService {

    @Resource
    CustomerMapper customerMapper;
    
    public boolean isPhone(String customer_phone) {
        return customerMapper.isPhone(customer_phone)==0;
    }
    
    public boolean regCustomer(Customer customer) {
        return customerMapper.regCustomer(customer) >= 0;
    }
    public Customer loginCustomer(Customer customer) {
        return customerMapper.loginCustomer(customer);
    }

    public Customer findCustomer(int customer_id) {
        // TODO Auto-generated method stub
        return customerMapper.findCustomer(customer_id);
    }

    public boolean updateCustomer(Customer customer) {
        // TODO Auto-generated method stub
        return customerMapper.updateCustomer(customer)==1;
    }
}
