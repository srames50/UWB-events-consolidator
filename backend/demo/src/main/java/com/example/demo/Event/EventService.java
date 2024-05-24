package com.example.demo.Event;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EventService {
    private final EventRepository eventRepository;

    @Autowired
    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }
    public List<Event> getAllEvents() {
        return eventRepository.findAll();
    }

    public void addNewEvent(Event event) {
        Optional<Event> eventOptional = eventRepository.findByEventName(event.getEventName());
        if (eventOptional.isPresent()) {
            throw  new IllegalArgumentException("Event already exists");
        }
        eventRepository.save(event);

    }
}

