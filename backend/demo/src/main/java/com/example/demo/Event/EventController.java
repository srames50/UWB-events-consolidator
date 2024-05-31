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
     * @param event the event object to be added
     */
    @PostMapping("/addEvent")
    public void registerEvent(@RequestBody Event event) {
        eventService.addNewEvent(event);
    }
}
