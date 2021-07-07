package com.isosoken.phongnha.service;

import com.isosoken.phongnha.model.Customer;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CustomerService {

    Customer save(Customer customer);

    List<Customer> getAll();
}
