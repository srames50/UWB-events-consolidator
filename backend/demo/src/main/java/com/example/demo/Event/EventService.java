package com.example.demo.Event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * Service class for managing Event-related operations.
 */
@Service
public class EventService {
    private final EventRepository eventRepository;

    /**
     * Constructor for EventService. Automatically injects the EventRepository dependency.
     *
     * @param eventRepository the repository for Event entities
     */
    @Autowired
    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    /**
     * Retrieves all events from the repository.
     *
     * @return a list of all events
     */
    public List<Event> getAllEvents() {
        return eventRepository.findAll();
    }

    /**
     * Adds a new event to the repository.
     * @param event the event object to be added
     * @throws IllegalArgumentException if an event with the same name already exists
     */
    public void addNewEvent(Event event) {
        Optional<Event> eventOptional = eventRepository.findById(event.getId());
        if (eventOptional.isPresent()) {
            throw new IllegalArgumentException("Event already exists");
        }
        event.setCreatedAt(LocalDateTime.now());
        eventRepository.save(event);
    }

    /**
     * Gets the events for the homepage
     *
     * @return Events need for the homepage
     * @throws IllegalArgumentException if there are no events with images
     */
    public List<Event> getHomePageEvents() throws IllegalArgumentException{
        List<Event> imageEvents = eventRepository.getSortedImageEvents();
        if (imageEvents.isEmpty()) {
            throw new IllegalArgumentException("No image events found");
        }
        // Get the events with images
        if(imageEvents.size() > 2){
            imageEvents = imageEvents.subList(0, 2);
        }
        // get the rest of the events that are not already added
        for(Event event : eventRepository.getSortedEvents()){
            if(!imageEvents.contains(event)){
                imageEvents.add(event);
            }
            // stop adding when there are enough events
            if(imageEvents.size() == 7){
                break;
            }
        }
        return imageEvents;
    }

}
