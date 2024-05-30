package com.example.demo.student;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository interface for Student entity.
 * Extends JpaRepository to provide CRUD operations on Student entities.
 */
@Repository
public interface StudentRepo extends JpaRepository<Student, Integer> {

    /**
     * Custom query method to find a student by their school ID.
     *
     * @param schoolID the school ID to search for
     * @return an Optional containing the found Student, or empty if not found
     */
    Optional<Student> findBySchoolID(String schoolID);
}
