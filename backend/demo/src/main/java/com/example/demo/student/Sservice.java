package com.example.demo.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class Sservice {

    private final StudentRepo studentRepo;

    @Autowired
    public Sservice(StudentRepo studentRepo) {
        this.studentRepo = studentRepo;
    }

    public List<Student> getStudents() {
        return studentRepo.findAll();
    }

    public void addNewStudent(Student student) {
        Optional<Student> studentOptional = studentRepo.findBySchoolID(student.getSchoolID());
        if (studentOptional.isPresent()) {
            throw new IllegalArgumentException("Student already exists");
        }
        studentRepo.save(student);

    }
}
