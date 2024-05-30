package com.example.demo.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Service class for handling student-related operations.
 */
@Service
public class Sservice {

    // Repository to handle CRUD operations on Student entities
    private final StudentRepo studentRepo;

    /**
     * Constructor for Sservice.
     *
     * @param studentRepo the repository to handle student operations
     */
    @Autowired
    public Sservice(StudentRepo studentRepo) {
        this.studentRepo = studentRepo;
    }

    /**
     * Retrieves all students from the repository.
     *
     * @return a list of all students
     */
    public List<Student> getStudents() {
        return studentRepo.findAll();
    }

    /**
     * Adds a new student to the repository.
     * Checks if the student already exists based on school ID before adding.
     *
     * @param student the student object to be added
     * @throws IllegalArgumentException if the student already exists
     */
    public void addNewStudent(Student student) {
        Optional<Student> studentOptional = studentRepo.findBySchoolID(student.getSchoolID());
        if (studentOptional.isPresent()) {
            throw new IllegalArgumentException("Student already exists");
        }
        studentRepo.save(student);
    }
}
