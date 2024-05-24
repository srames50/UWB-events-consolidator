package com.example.demo;

//import com.example.demo.Event.Event;
import com.example.demo.EventStudent.EventStudent;
import com.example.demo.student.Student;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.List;

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
  
  
   /* @GetMapping("/getStudents")
    public List<Student> getStudents() {
        return List.of(
                new Student(
                        1, "Test Name", "Test ID", "TestUserName"
                ));
    }*/
    
    /*@GetMapping("/getEvents")
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
    }*/

    @GetMapping("/getEventStudents")
    public List<EventStudent> getEventStudents() {
        return List.of(
                new EventStudent(
                        1, 1, 1
                ),
                new EventStudent(
                        2, 2, 1
                ),
                new EventStudent(
                        3, 1, 2
                )
        );
    }

}