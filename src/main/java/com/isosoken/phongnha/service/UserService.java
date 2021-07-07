package com.isosoken.phongnha.service;

import com.isosoken.phongnha.model.Role;
import com.isosoken.phongnha.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface UserService {

    void save(User user);

    Optional<User> findById(Long id);

    User findByUsername(String username);

    List<User> listUser(Pageable pageable);

    boolean changeStatus(Long userId);

    boolean delete(Long userId);

    long countAll();

    List<Role> getAllRoles();

}
