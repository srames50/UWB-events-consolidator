package com.example.demo.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import com.example.demo.Event.Event;

import java.util.Set;
import java.util.HashSet;

/**
 * Entity class representing a User in the database.
 */
@Entity
@Table(name = "users")
public class User {

    // Database assigned ID
    @Id
    @SequenceGenerator(
            name = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_sequence"
    )
    private Integer ID;

    // Username of the user
    private String userName;

    // Password of the user
    private String password;

    // Indicates if the user has admin powers (true if they are an admin)
    private Boolean adminPowers;

    // Events associated with the user
    @ManyToMany
    @JoinTable(
            name = "user_events",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    private Set<Event> events = new HashSet<>();

    /**
     * Default constructor.
     */
    public User() {
    }

    /**
     * Parameterized constructor to initialize a User object.
     *
     * @param adminPowers indicates if the user has admin powers
     * @param password    password of the user
     * @param userName    username of the user
     */
    public User(Boolean adminPowers, String password, String userName) {
        this.adminPowers = adminPowers;
        this.password = password;
        this.userName = userName;
    }

    // Getters and setters

    /**
     * Gets the ID of the user.
     * 
     * @return the ID of the user
     */
    public Integer getID() {
        return ID;
    }

    /**
     * Sets the ID of the user.
     * 
     * @param ID the ID to set
     */
    public void setID(Integer ID) {
        this.ID = ID;
    }

    /**
     * Gets the username of the user.
     * 
     * @return the username of the user
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets the username of the user.
     * 
     * @param userName the username to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets the password of the user.
     * 
     * @return the password of the user
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets the password of the user.
     * 
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Gets the admin powers status of the user.
     * 
     * @return true if the user has admin powers, false otherwise
     */
    public Boolean getAdminPowers() {
        return adminPowers;
    }

    /**
     * Sets the admin powers status of the user.
     * 
     * @param adminPowers the admin powers status to set
     */
    public void setAdminPowers(Boolean adminPowers) {
        this.adminPowers = adminPowers;
    }

    /**
     * Gets the events associated with the user.
     * 
     * @return the set of events associated with the user
     */
    public Set<Event> getEvents() {
        return events;
    }

    /**
     * Sets the events associated with the user.
     * 
     * @param events the set of events to set
     */
    public void setEvents(Set<Event> events) {
        this.events = events;
    }

    /**
     * Returns a string representation of the User object.
     * 
     * @return a string representation of the User object
     */
    @Override
    public String toString() {
        return "User{" +
                "ID=" + ID +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", adminPowers=" + adminPowers +
                '}';
    }
}
