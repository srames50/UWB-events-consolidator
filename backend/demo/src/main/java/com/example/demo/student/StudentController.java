package com.example.demo.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentController {

    private  final Sservice sservice;
    @Autowired
    public StudentController(Sservice sservice) {
        this.sservice = sservice;
    }
    @GetMapping
    public List<Student> getStudents() {
        return sservice.getStudents();

    }
}
