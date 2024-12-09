package com.example.demo.Event;

import java.time.LocalDateTime;
public class Event {
    private int eventID;
    private String eventName;
    private String eventAbout;
    private LocalDateTime timeOfEventStart;
    private LocalDateTime timeOfEventEnd;
    private LocalDateTime timePosted;
    private byte[] eventImage;

    public Event(int eventID, String eventName, String eventAbout, LocalDateTime timeOfEventStart, LocalDateTime timeOfEventEnd, LocalDateTime timePosted, byte[] eventImage) {
        this.eventID = eventID;
        this.eventName = eventName;
        this.eventAbout = eventAbout;
        this.timeOfEventStart = timeOfEventStart;
        this.timeOfEventEnd = timeOfEventEnd;
        this.timePosted = timePosted;
        this.eventImage = eventImage;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventAbout() {
        return eventAbout;
    }

    public void setEventAbout(String eventAbout) {
        this.eventAbout = eventAbout;
    }

    public LocalDateTime getTimeOfEventStart() {
        return timeOfEventStart;
    }

    public void setTimeOfEventStart(LocalDateTime timeOfEventStart) {
        this.timeOfEventStart = timeOfEventStart;
    }

    public LocalDateTime getTimeOfEventEnd() {
        return timeOfEventEnd;
    }

    public void setTimeOfEventEnd(LocalDateTime timeOfEventEnd) {
        this.timeOfEventEnd = timeOfEventEnd;
    }

    public LocalDateTime getTimePosted() {
        return timePosted;
    }

    public void setTimePosted(LocalDateTime timePosted) {
        this.timePosted = timePosted;
    }

    public byte[] getEventImage() {
        return eventImage;
    }

    public void setEventImage(byte[] eventImage) {
        this.eventImage = eventImage;
    }

    @Override
    public String toString() {
        return "Event{" +
                "eventID=" + eventID +
                ", eventName='" + eventName + '\'' +
                ", eventAbout='" + eventAbout + '\'' +
                ", timeOfEventStart=" + timeOfEventStart +
                ", timeOfEventEnd=" + timeOfEventEnd +
                ", timePosted=" + timePosted +
                '}';
    }
}
