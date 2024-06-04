package com.example.demo.Event;

import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Event entity. Extends JpaRepository for basic CRUD operations.
 */
@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {

    /**
     * Finds an event by its name.
     *
     * @param ID the name of the event to find
     * @return an Optional containing the found event, or an empty Optional if no event found
     */
    Optional<Event> findById(Integer ID);

    /**
     *Query that gets all events with images. Will later sort to get however many are wanted for the homepage
     * @return all events with images sorted by time
     */
    @Query("SELECT e FROM Event e WHERE e.image IS NOT NULL ORDER BY e.startDate, e.startTime")
    List<Event> getSortedImageEvents();
    /**
     *Query that gets sorted events . Will later sort to get however many are wanted for the homepage
     * @return all events  sorted by time
     */
    @Query("SELECT e FROM Event e WHERE e.image IS NULL ORDER BY e.startDate, e.startTime")
    List<Event> getSortedEvents();

    /**
     * Query that gets events occurring on a specific date.
     *
     * @param date the date to search for events
     * @return a list of events occurring on the specified date
     */
    @Query("SELECT e FROM Event e WHERE :date BETWEEN e.startDate AND e.endDate")
    Optional<List<Event>> getEventsByDate(LocalDate date);

    /**
     * Query that gets events with an exact match to the event in the database
     * @param name Name of event in search
     * @return Event if it exists
     */
    @Query("SELECT e FROM Event e where e.eventName = :name")
    Optional<Event> getEventByEventName(String name);

    /**
     * Query that gets all events with the phrase in the name
     * @param phrase part of search by user
     * @return List of events with phrase in it
     */
    @Query("SELECT e FROM Event e WHERE e.eventName LIKE %:phrase%")
    Optional<List<Event>> getEventsWithPhrase(String phrase);

}
