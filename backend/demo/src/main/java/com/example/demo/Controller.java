package com.example.demo;

import com.example.demo.EventStudent.EventStudent;
import com.example.demo.student.Student;
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

    /**
     * Endpoint to return a list of EventStudent objects for testing purposes.
     * 
     * @return a list of EventStudent objects
     */
    @GetMapping("/getEventStudents")
    public List<EventStudent> getEventStudents() {
        return List.of(
            new EventStudent(
                1, // Event ID
                1, // Student ID
                1  // Role ID
            ),
            new EventStudent(
                2, // Event ID
                2, // Student ID
                1  // Role ID
            ),
            new EventStudent(
                3, // Event ID
                1, // Student ID
                2  // Role ID
            )
        );
    }

    // Uncomment the following code to add more endpoints for getting students and events

    /**
     * Endpoint to return a list of Student objects for testing purposes.
     * 
     * @return a list of Student objects
     */
    /*
    @GetMapping("/getStudents")
    public List<Student> getStudents() {
        return List.of(
            new Student(
                1, "Test Name", "Test ID", "TestUserName"
            ));
    }
    */

    /**
     * Endpoint to return a list of Event objects for testing purposes.
     * 
     * @return a list of Event objects
     */
    /*
    @GetMapping("/getEvents")
    public List<Event> getEvents() {
        return List.of(
            new Event(
                1,
                "Sample Event",
                "This is a test event to demonstrate the Event class.",
                LocalDateTime.of(2024, 5, 22, 10, 0),
                LocalDateTime.of(2024, 5, 22, 12, 0),
                LocalDateTime.now(),
                null
            ));
    }
    */
}
