package com.example.demo.student;
//Class For Students/Users of App
public class Student {
    private int id;
    private String name;
    private String schoolID;
    private String username;

    public Student(int id, String name, String schoolID, String username) {
        this.id = id;
        this.name = name;
        this.schoolID = schoolID;
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSchoolID() {
        return schoolID;
    }

    public void setSchoolID(String schoolID) {
        this.schoolID = schoolID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


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
