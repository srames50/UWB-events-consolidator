package com.example.demo.Event;

import com.example.demo.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

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
     *
     * @return a list of all events
     */
    @GetMapping("allEvents")
    public List<Event> getAllEvents() {
        return eventService.getAllEvents();
    }

    /**
     * Endpoint to register a new event.
     *
     * @param event the event object to be added
     */
    @PostMapping
    public void registerEvent(@RequestBody Event event) {
        eventService.addNewEvent(event);
    }
}
