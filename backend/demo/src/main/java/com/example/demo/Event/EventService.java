package com.example.demo.Event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
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


    /**
     * Gets all events that take place on a specified date
     * @param month month of date
     * @param day day of date
     * @param year year of date
     * @return List of Dates if They exist
     * @throws IllegalArgumentException If date is entered incorrectly
     * @throws NullPointerException If there are no events on that date
     */
    public List<Event> getEventsByDate(Integer month,Integer day,Integer year) throws IllegalArgumentException, NullPointerException{
        try{
            LocalDate localDate = LocalDate.of(year,month,day);
            Optional<List<Event>> possibleEvents = eventRepository.getEventsByDate(localDate);
            if(possibleEvents.isPresent()){
                return possibleEvents.get();
            }else{
                throw new NullPointerException("No events on specified date");

            }
        }
        catch (Exception e){
            throw new IllegalArgumentException("Must enter a valid date");
        }
    }

    /**
     * Finds events by its name
     * @param name Name of event from search bar
     * @return Event if it exists
     * @throws NullPointerException If there is no match
     */
    public Event getByName(String name) throws NullPointerException{
        Optional<Event> possibleEvent = eventRepository.getEventByEventName(name);
        if(possibleEvent.isPresent()){
            return possibleEvent.get();
        }else{
            throw new NullPointerException("No event found");
        }
    }

}
