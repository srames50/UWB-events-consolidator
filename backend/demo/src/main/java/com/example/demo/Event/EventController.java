package com.example.demo.Event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
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
     * End point to get events on a certain date
     * @param month month of date
     * @param day day of date
     * @param year year of date
     * EXAMPLE http://localhost:8080/event/byDate/06/01/2024
     * @return JSON of all events on that date
     */
    @GetMapping("byDate/{month}/{day}/{year}")
    public List<Event> getByDate(@PathVariable Integer month,
                                 @PathVariable Integer day, @PathVariable Integer year) {
        return eventService.getEventsByDate(month,day,year);
    }
    /**
     *End Point to find event by Name
     * @param name Name of search
     * EXAMPLE http://localhost:8080/event/byNameExact/Rahul_Test_Event1 (Make sure the event name exists in database)
     * @return event if found
     */
    @GetMapping("byNameExact/{name}")
    public Event getByName(@PathVariable String name){
        return eventService.getByName(name);
    }

    /**
     * Finds events with a specific word/phrase in them
     * @param search the search var input by the user
     * EXAMPLE http://localhost:8080/event/byNamePartial/Rahul_Spring
     * @return list of matching events
     */
    @GetMapping("byNamePartial/{search}")
    public List<Event> getByNamePartial(@PathVariable String search){
        return eventService.getByNamePartial(search);
    }

    /**
     * Endpoint for editing the image of an event
     * @param id id of the event
     * TO TEST SEND REQUEST LIKE THIS:
     *
     *  $imageUrl = "https://th-thumbnailer.cdn-si-edu.com/_sWVRSTELwK0-Ave6S4mFpxr1D0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25MikeReyfman_Waterfall.jpg"
     * Invoke-RestMethod -Uri "http://localhost:8080/event/editImage/6" -Method Post -Body @{ newImage = $imageUrl } -ContentType "application/x-www-form-urlencoded"
     *
     * @param newImage new image for the event
     */
    @PostMapping("editImage/{id}")
    public void editImage(@PathVariable Integer id, @RequestParam String newImage){
        eventService.editImage(id,newImage);
    }

    /**
     * Endpoint for editing the name of an event
     *
     * @param id id of the event
     * @param eventName new name for the event
     */
    @PostMapping("/editEventName/{id}")
    public void editEventName(@PathVariable Integer id, @RequestParam String eventName) {
        eventService.editEventName(id, eventName);
    }

    /**
     * Endpoint for editing the description of an event
     *
     * @param id           id of the event
     * @param description new description for the event
     */
    @PostMapping("/editDescription/{id}")
    public void editDescription(@PathVariable Integer id, @RequestParam String description) {
        eventService.editDescription(id, description);
    }


    /**
     * Endpoint for editing the start date of an event
     *
     * @param id id of the event
     * @param startDate new start date for the event
     */
    @PostMapping("/editStartDate/{id}")
    public void editStartDate(@PathVariable Integer id,@RequestParam String startDate ) {
        eventService.editStartDate(id, startDate);
    }

    /**
     * Endpoint for editing the end date of an event
     * USE:
     *
     * date = "YYYY-MM-DD"
     * Invoke-RestMethod -Uri "http://localhost:8080/event/editStartDate/6" -Method Post -Body @{ startDate = $date } -ContentType "application/x-www-form-urlencoded"
     * @param id id of the event
     * @param endDate new end date for the event
     */
    @PostMapping("/editEndDate/{id}")
    public void editEndDate(@PathVariable Integer id, @RequestParam String endDate) {
        eventService.editEndDate(id, endDate);
    }

    /**
     * Endpoint for editing start time
     * USE:
     *
     * $time = "00:00:01"
     * Invoke-RestMethod -Uri "http://localhost:8080/event/editStartTime/6" -Method Post -Body @{ startTime = $time } -ContentType "application/x-www-form-urlencoded"
     *
     * @param id id of the event being edited
     * @param startTime new start time of event
     */
    @PostMapping("editStartTime/{id}")
    public void editStartTime(@PathVariable Integer id, @RequestParam String startTime) {
        eventService.editStartTime(id, startTime);
    }

    /**
     * Endpoint for editing end time
     * @param id of the event being edited
     * @param endTime new end time of the event
     */
    @PostMapping("editEndTime/{id}")
    public void editEndTime(@PathVariable Integer id, @RequestParam String endTime) {
        eventService.editEndTime(id,endTime);
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
