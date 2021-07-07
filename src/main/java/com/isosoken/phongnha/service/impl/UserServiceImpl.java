package com.isosoken.phongnha.service.impl;

import com.isosoken.phongnha.Repository.RoleRepository;
import com.isosoken.phongnha.Repository.UserRepository;
import com.isosoken.phongnha.model.Role;
import com.isosoken.phongnha.model.User;
import com.isosoken.phongnha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public List<User> listUser(Pageable pageable) {
        try {
            Page<User> userPage = userRepository.findAll(pageable);
            return userPage.getContent();
        } catch (Exception e) {
            return Collections.emptyList();
        }
    }

    @Override
    public boolean changeStatus(Long userId) {
        Optional<User> user = userRepository.findById(userId);
        try {
            if (user.isPresent()) {
                User userDb = user.get();
                userDb.setActive(!userDb.isActive());
                userRepository.save(userDb);
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean delete(Long userId) {
        try {
            userRepository.deleteById(userId);
            return true;

        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public long countAll() {
        return userRepository.count();
    }

    @Override
    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }
}
