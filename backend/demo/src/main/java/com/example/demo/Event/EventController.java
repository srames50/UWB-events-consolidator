package com.example.demo.Event;


import com.example.demo.student.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/event")
public class EventController {
    private final EventService eventService;
    @Autowired
    public EventController(EventService eventService) {
        this.eventService = eventService;
    }
    // http://localhost:8080/event/allEvents
    @GetMapping("allEvents")
    public List<Event> getStudents() {
        return eventService.getAllEvents();
    }
    @PostMapping
    public void registerEvent( @RequestBody Event event) {
        eventService.addNewEvent(event);

    }


}

