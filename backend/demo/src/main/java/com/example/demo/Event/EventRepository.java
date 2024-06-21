package com.example.demo.Event;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

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
     * Query that gets all within a week sorted. Will later sort to get however many are wanted for the homepage
     * all events within a week sorted by time
     * @param endOfWeek End of range of events wanted
     * @param now start of range of events wanted
     * @return list of events that take place this week
     */
    @Query("SELECT e FROM Event e WHERE e.startDate BETWEEN :now and :endOfWeek ORDER BY e.startDate, e.startTime")
    List<Event> getSortedEventsWithinWeek(LocalDate endOfWeek, LocalDate now);


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

    @Modifying
    @Query("DELETE FROM Event e WHERE e.id = :eventId")
    void deleteEventById( int eventId);




}
