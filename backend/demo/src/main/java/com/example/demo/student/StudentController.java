package com.example.demo.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    @PostMapping
    public void registerStudent( @RequestBody Student student) {
        sservice.addNewStudent(student);

    }
}
