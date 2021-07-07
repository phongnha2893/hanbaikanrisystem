package com.isosoken.phongnha.controller;

import com.isosoken.phongnha.common.Validator.UserRegistrationValidator;
import com.isosoken.phongnha.model.User;
import com.isosoken.phongnha.service.SecurityService;
import com.isosoken.phongnha.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private UserService userService;

    @Autowired
    private UserRegistrationValidator userValidator;

    @Autowired
    private SecurityService securityService;

    private static final int DEFAULT_PAGE_SIZE = 10;


    @GetMapping("/login")
    public String login(Model model, String error, String logout, @ModelAttribute("message") String message) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/", "/dashboard"})
    public String welcome(Model model) {
        return listUsers(1, DEFAULT_PAGE_SIZE, model);
    }

    @GetMapping("/list-user")
    public String listUsers(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                            @RequestParam(name = "size", required = false, defaultValue = DEFAULT_PAGE_SIZE + "") Integer size,
                            Model model) {
        Pageable pageable = PageRequest.of(page - 1, size);
        model.addAttribute("listUser", userService.listUser(pageable));
        model.addAttribute("currentPage", page);
        long totalItems = userService.countAll();
        model.addAttribute("totalPages", getTotalPage(totalItems, size));
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("currentRoles", securityService.getCurrentUserRoles());

        return "list-user";
    }

    @GetMapping("/user/change-status/{userId}")
    public String changeUserStatus(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                   @PathVariable Long userId,
                                   Model model) {
        userService.changeStatus(userId);
        return listUsers(page, DEFAULT_PAGE_SIZE, model);
    }


    @GetMapping({"/add-user"})
    public String addUser(Model model) {
        if (securityService.getCurrentUserRoles().contains("ADMIN")) {
            model.addAttribute("userForm", new User());
            model.addAttribute("rolesList", userService.getAllRoles());

            return "add-user";
        } else {
            return welcome(model);
        }
    }

    @PostMapping("/user/add")
    public String saveUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
        if (securityService.getCurrentUserRoles().contains("ADMIN")) {
            try {
                userValidator.validate(userForm, bindingResult);
                if (bindingResult.hasErrors()) {
                    model.addAttribute("rolesList", userService.getAllRoles());
                    return "add-user";
                }
                userService.save(userForm);
            } catch (Exception e) {
                redirectAttributes.addFlashAttribute("error", e.getMessage());
                return "redirect:/list-user";
            }
            redirectAttributes.addFlashAttribute("message", "User added!");
            return "redirect:/list-user";

        } else {
            return welcome(model);
        }
    }

    @GetMapping("/user/delete/{userId}")
    public String deleteUser(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                             @PathVariable Long userId,
                             Model model) {
        if (securityService.getCurrentUserRoles().contains("ADMIN")) {
            userService.delete(userId);
            return listUsers(page, DEFAULT_PAGE_SIZE, model);
        } else {
            return welcome(model);
        }
    }

    @GetMapping("/user/edit/{userId}")
    public String editUser(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                           @PathVariable Long userId,
                           Model model) {
        if (securityService.getCurrentUserRoles().contains("ADMIN")) {
            Optional<User> user = userService.findById(userId);
            User editedUser = user.orElse(new User());
            editedUser.setPassword("");
            model.addAttribute("userForm", editedUser);
            model.addAttribute("rolesList", userService.getAllRoles());

            return "add-user";
        } else {
            return welcome(model);
        }

    }


    private int getTotalPage(long totalItems, int pageSize) {
        if (pageSize == 0) return 0;
        if (totalItems % pageSize == 0) {
            return (int) totalItems / pageSize;
        }
        return (int) totalItems / pageSize + 1;
    }


}
