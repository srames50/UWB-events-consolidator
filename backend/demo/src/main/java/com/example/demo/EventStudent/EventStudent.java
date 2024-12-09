package com.example.demo.EventStudent;
// Junction Table of Event and Student
public class EventStudent {
    private int eventStudentID;
    private int studentID;
    private int eventID;

    public EventStudent(int eventStudentID, int studentID, int eventID) {
        this.eventStudentID = eventStudentID;
        this.studentID = studentID;
        this.eventID = eventID;
    }

    public int getEventStudentID() {
        return eventStudentID;
    }

    public void setEventStudentID(int eventStudentID) {
        this.eventStudentID = eventStudentID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    @Override
    public String toString() {
        return "EventStudent{" +
                "eventStudentID=" + eventStudentID +
                ", studentID=" + studentID +
                ", eventID=" + eventID +
                '}';
    }
}
