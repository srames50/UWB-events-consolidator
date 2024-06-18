package com.example.demo;

import com.example.demo.student.Student;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Main class for the Spring Boot application.
 * This class contains the main method which serves as the entry point for the application.
 */
@SpringBootApplication
public class DemoApplication {

    /**
     * The main method which serves as the entry point for the Spring Boot application.
	 * Use this class to start your Backend. 
     * 
     * @param args command-line arguments
     */
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}



