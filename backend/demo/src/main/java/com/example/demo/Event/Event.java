package com.example.demo.Event;

import jakarta.persistence.*;

import com.example.demo.user.User;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

/**
 * Class representing events in the application.
 */
@Entity
@Table(name = "events")
public class Event {
    @Id
    @SequenceGenerator(
            name = "event_sequence",
            sequenceName = "event_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "event_sequence"
    )
  
    private int id;
    // Name of the event
    private String eventName;
    // Description of the event
    private String description;
    // Start time of the event
    private LocalDateTime startTime;
    // End time of the event
    private LocalDateTime endTime;
    // Start date of the event
    private LocalDate startDate;
    // End date of the event
    private LocalDate endDate;
    // Image associated with the event
    private String image;
    // Timestamp when the event was created
    private LocalDateTime createdAt;
    //Use this if you get stack overflow error should fix it
    //@JsonIgnore
    @ManyToMany(mappedBy = "events")
    private Set<User> signedUpUsers = new HashSet<>();
  
    // Constructors

    /**
     * Constructor for creating an Event with specified details.
     *
     * @param eventName   the name of the event
     * @param description the description of the event
     * @param startTime   the start time of the event
     * @param endTime     the end time of the event
     * @param startDate   the start date of the event
     * @param endDate     the end date of the event
     * @param image       the image associated with the event
     */
    public Event(String eventName, String description, LocalDateTime startTime, LocalDateTime endTime, LocalDate startDate, LocalDate endDate, String image) {
        this.eventName = eventName;
        this.description = description;
        this.startTime = startTime;
        this.endTime = endTime;
        this.startDate = startDate;
        this.endDate = endDate;
        this.image = image;
        this.createdAt = LocalDateTime.now();
    }

    /**
     * Constructor for creating an Event with specified details including ID.
     *
     * @param id          the unique identifier of the event
     * @param eventName   the name of the event
     * @param description the description of the event
     * @param startTime   the start time of the event
     * @param endTime     the end time of the event
     * @param startDate   the start date of the event
     * @param endDate     the end date of the event
     * @param image       the image associated with the event
     */
    public Event(int id, String eventName, String description, LocalDateTime startTime, LocalDateTime endTime, LocalDate startDate, LocalDate endDate, String image) {
        this.id = id;
        this.eventName = eventName;
        this.description = description;
        this.startTime = startTime;
        this.endTime = endTime;
        this.startDate = startDate;
        this.endDate = endDate;
        this.image = image;
        this.createdAt = LocalDateTime.now();
    }

    // Getters and Setters
    /**
     * Default constructor for creating an empty Event.
     */
    public Event() {
    }

    // Getters and setters

    /**
     * Gets the unique identifier of the event.
     *
     * @return the event ID
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the unique identifier of the event.
     *
     * @param id the event ID to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the name of the event.
     *
     * @return the event name
     */
    public String getEventName() {
        return eventName;
    }

    /**
     * Sets the name of the event.
     *
     * @param eventName the event name to set
     */
    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    /**
     * Gets the description of the event.
     *
     * @return the event description
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of the event.
     *
     * @param description the event description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Gets the start time of the event.
     *
     * @return the event start time
     */
    public LocalDateTime getStartTime() {
        return startTime;
    }

    /**
     * Sets the start time of the event.
     *
     * @param startTime the event start time to set
     */
    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    /**
     * Gets the end time of the event.
     *
     * @return the event end time
     */
    public LocalDateTime getEndTime() {
        return endTime;
    }

    /**
     * Sets the end time of the event.
     *
     * @param endTime the event end time to set
     */
    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    /**
     * Gets the start date of the event.
     *
     * @return the event start date
     */
    public LocalDate getStartDate() {
        return startDate;
    }

    /**
     * Sets the start date of the event.
     *
     * @param startDate the event start date to set
     */
    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    /**
     * Gets the end date of the event.
     *
     * @return the event end date
     */
    public LocalDate getEndDate() {
        return endDate;
    }

    /**
     * Sets the end date of the event.
     *
     * @param endDate the event end date to set
     */
    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    /**
     * Gets the image associated with the event.
     *
     * @return the event image
     */
    public String getImage() {
        return image;
    }

    /**
     * Sets the image associated with the event.
     *
     * @param image the event image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * Gets the creation timestamp of the event.
     *
     * @return the event creation timestamp
     */
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    /**
     * Sets the creation timestamp of the event.
     *
     * @param createdAt the event creation timestamp to set
     */
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Set<User> getSignedUpUsers() {
        return signedUpUsers;
    }

    public void setSignedUpUsers(Set<User> signedUpUsers) {
        this.signedUpUsers = signedUpUsers;
    }

    /**
     * Returns a string representation of the Event.
     *
     * @return a string representation of the Event object
     */
    @Override
    public String toString() {
        return "Event{" +
                "id=" + id +
                ", eventName='" + eventName + '\'' +
                ", description='" + description + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", image='" + image + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}