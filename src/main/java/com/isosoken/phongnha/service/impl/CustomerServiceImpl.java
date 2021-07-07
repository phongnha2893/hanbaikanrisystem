package com.isosoken.phongnha.service.impl;

import com.isosoken.phongnha.Repository.CustomerRepository;
import com.isosoken.phongnha.model.Customer;
import com.isosoken.phongnha.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer save(Customer customer) {
        return customerRepository.save(customer);
    }

    @Override
    public List<Customer> getAll() {
        return customerRepository.findAll();
    }
}
