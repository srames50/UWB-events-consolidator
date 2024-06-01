package com.example.demo.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * REST controller for handling student-related requests.
 */
@RestController
@RequestMapping("/student")
public class StudentController {

    // Service to handle business logic for student operations
    private final Sservice sservice;

    /**
     * Constructor for StudentController.
     *
     * @param sservice the service to handle student operations
     */
    @Autowired
    public StudentController(Sservice sservice) {
        this.sservice = sservice;
    }

    /**
     * Endpoint to retrieve all students.
     *
     * @return a list of all students
     */
    @GetMapping
    public List<Student> getStudents() {
        return sservice.getStudents();
    }

    /**
     * Endpoint to register a new student.
     *
     * @param student the student object to be registered
     */
    @PostMapping
    public void registerStudent(@RequestBody Student student) {
        sservice.addNewStudent(student);
    }
}
