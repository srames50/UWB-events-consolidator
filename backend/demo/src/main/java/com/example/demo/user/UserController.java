package com.example.demo.user;

import com.example.demo.Event.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping("allUsers")
    public List<User> getStudents() {
        return userService.getAllUsers();
    }
    @PostMapping
    public void registerEvent( @RequestBody User user) {
        userService.addUser(user);
    }



}
