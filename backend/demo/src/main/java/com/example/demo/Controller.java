package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Testing Functions/ Practice with endpoints

// Testing Controller so we can see connections with Frontend

// http://localhost:8080/api/hello

@RestController
@RequestMapping("/api")
public class Controller {
    
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello World!"; 
    }
}

