package com.example.demo;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Controller class to handle API requests for testing and practice with endpoints.
 * This class is used to test connections with the frontend.
 */
@RestController
@RequestMapping("/api")
public class Controller {
    
    /**
     * Endpoint to return a "Hello World!" message.
     * 
     * @return a greeting message
     */
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello World!"; 
    }


}
