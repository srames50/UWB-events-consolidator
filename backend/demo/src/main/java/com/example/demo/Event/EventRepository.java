package com.example.demo.Event;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * Repository interface for Event entity. Extends JpaRepository for basic CRUD operations.
 */
@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {

    /**
     * Finds an event by its name.
     *
     * @param eventName the name of the event to find
     * @return an Optional containing the found event, or an empty Optional if no event found
     */
    Optional<Event> findByEventName(String eventName);

}
