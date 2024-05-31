package com.example.demo.Event;

import jakarta.persistence.criteria.CriteriaBuilder;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

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

}
