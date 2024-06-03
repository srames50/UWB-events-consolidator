package com.example.demo.Event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controller class for managing Event-related HTTP requests.
 */
@RestController
@RequestMapping("/event")
public class EventController {
    private final EventService eventService;

    /**
     * Constructor for EventController. Automatically injects the EventService dependency.
     *
     * @param eventService the service layer for handling event-related operations
     */
    @Autowired
    public EventController(EventService eventService) {
        this.eventService = eventService;
    }

    /**
     * Endpoint to retrieve all events.
     * Example URL: http://localhost:8080/event/allEvents
     * USED TO CONNECT TO SEARCH BAR
     * @return a list of all events
     */
    @GetMapping("allEvents")
    public List<Event> getAllEvents() {
        return eventService.getAllEvents();
    }

    /**
     * Gets the events for the homepage (Two with picture) (Next Five)
     * Example URL: http://localhost:8080/event/homeEvents
     * USED TO CONNECT TO HOMEPAGE
     * @return the needed events for the homepage
     */
    @GetMapping("homeEvents")
    public List<Event> getHomeEvents() {
        return eventService.getHomePageEvents();
    }


    /**
     * Endpoint to register a new event.
     * USE TO ADD/POST EVENT
     * USE TO TEST/ADD Invoke-RestMethod -Uri http://localhost:8080/event/addEvent -Method Post -ContentType "application/json" -Body '{"eventName":"New","description":"Event Description","startTime":"2024-06-01T10:00:00","endTime":"2024-06-01T12:00:00","startDate":"2024-06-01","endDate":"2024-06-01","image":"image_url"}'
     * @param event the event object to be added
     */
    @PostMapping("/addEvent")
    public void registerEvent(@RequestBody Event event) {
        eventService.addNewEvent(event);
    }
}
