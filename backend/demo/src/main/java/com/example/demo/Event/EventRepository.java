package com.example.demo.Event;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

@Repository
public interface EventRepository extends JpaRepository<Event, Integer>{
    //@Query("SELECT e FROM Event e WHERE e.eventName = ? 1")
    Optional<Event> findByEventName(String eventName);

}
