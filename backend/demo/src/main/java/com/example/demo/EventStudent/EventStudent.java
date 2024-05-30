package com.example.demo.EventStudent;

/**
 * Junction Table class representing the relationship between Event and Student.
 */
public class EventStudent {
    // Unique identifier for the EventStudent relationship
    private int eventStudentID;
    // Unique identifier for the Student
    private int studentID;
    // Unique identifier for the Event
    private int eventID;

    /**
     * Constructor for creating an EventStudent relationship.
     *
     * @param eventStudentID unique identifier for the EventStudent relationship
     * @param studentID unique identifier for the Student
     * @param eventID unique identifier for the Event
     */
    public EventStudent(int eventStudentID, int studentID, int eventID) {
        this.eventStudentID = eventStudentID;
        this.studentID = studentID;
        this.eventID = eventID;
    }

    /**
     * Gets the unique identifier for the EventStudent relationship.
     *
     * @return the eventStudentID
     */
    public int getEventStudentID() {
        return eventStudentID;
    }

    /**
     * Sets the unique identifier for the EventStudent relationship.
     *
     * @param eventStudentID the eventStudentID to set
     */
    public void setEventStudentID(int eventStudentID) {
        this.eventStudentID = eventStudentID;
    }

    /**
     * Gets the unique identifier for the Student.
     *
     * @return the studentID
     */
    public int getStudentID() {
        return studentID;
    }

    /**
     * Sets the unique identifier for the Student.
     *
     * @param studentID the studentID to set
     */
    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    /**
     * Gets the unique identifier for the Event.
     *
     * @return the eventID
     */
    public int getEventID() {
        return eventID;
    }

    /**
     * Sets the unique identifier for the Event.
     *
     * @param eventID the eventID to set
     */
    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    /**
     * Returns a string representation of the EventStudent relationship.
     *
     * @return a string representation of the EventStudent object
     */
    @Override
    public String toString() {
        return "EventStudent{" +
                "eventStudentID=" + eventStudentID +
                ", studentID=" + studentID +
                ", eventID=" + eventID +
                '}';
    }
}
