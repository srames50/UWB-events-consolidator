package com.example.demo.student;

import jakarta.persistence.*;

/**
 * Entity class representing a Student/User in the application.
 */
@Entity
@Table
public class Student {

    // Auto-generated ID for the student
    @Id
    @SequenceGenerator(
            name = "student_sequence",
            sequenceName = "student_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "student_sequence"
    )
    private int id;

    // Name of the student
    private String name;

    // School ID of the student
    private String schoolID;

    // Username of the student
    private String username;

    /**
     * Parameterized constructor to initialize a Student object with all fields.
     *
     * @param id       the ID of the student
     * @param name     the name of the student
     * @param schoolID the school ID of the student
     * @param username the username of the student
     */
    public Student(int id, String name, String schoolID, String username) {
        this.id = id;
        this.name = name;
        this.schoolID = schoolID;
        this.username = username;
    }

    /**
     * Parameterized constructor to initialize a Student object without an ID.
     *
     * @param name     the name of the student
     * @param schoolID the school ID of the student
     * @param username the username of the student
     */
    public Student(String name, String schoolID, String username) {
        this.name = name;
        this.schoolID = schoolID;
        this.username = username;
    }

    /**
     * Default constructor for Student.
     */
    public Student() {

    }

    // Getters and setters for all fields

    /**
     * Gets the ID of the student.
     *
     * @return the ID of the student
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the ID of the student.
     *
     * @param id the ID to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the name of the student.
     *
     * @return the name of the student
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the student.
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the school ID of the student.
     *
     * @return the school ID of the student
     */
    public String getSchoolID() {
        return schoolID;
    }

    /**
     * Sets the school ID of the student.
     *
     * @param schoolID the school ID to set
     */
    public void setSchoolID(String schoolID) {
        this.schoolID = schoolID;
    }

    /**
     * Gets the username of the student.
     *
     * @return the username of the student
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the username of the student.
     *
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Returns a string representation of the Student object.
     *
     * @return a string representation of the Student object
     */
    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", schoolID='" + schoolID + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
