package com.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.reponsitory.OrderReponsitory;
import com.edu.service.UserService;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    
    @Autowired
    OrderReponsitory orderReponsitory;
    
    @RequestMapping("/user")
    public String list(Model model) {
        model.addAttribute("user", userService.findAll());
        return "user/list";
    }
    @RequestMapping("/user/detail/{username}")
    public String detail(Model model,@PathVariable("username") String username) {
        model.addAttribute("user", userService.findID(username));
        model.addAttribute("order", orderReponsitory.findUsername(username));
        return "user/detail";
    }
}
