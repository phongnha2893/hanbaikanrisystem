package com.isosoken.phongnha.Repository;

import com.isosoken.phongnha.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Customer save(Customer customer);

    Customer findFirstByCustomerCode(Long customerCode);
}
