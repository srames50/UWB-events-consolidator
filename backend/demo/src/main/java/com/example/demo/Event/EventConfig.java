package com.example.demo.Event;


import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Configuration
public class EventConfig {
    @Bean
    CommandLineRunner EventcommandLineRunner(EventRepository eventRepository) {
        return args -> {
            String eventName = "Spring Festival";
            String description = "A festival to celebrate the arrival of spring.";
            LocalDateTime startTime = LocalDateTime.of(2024, 5, 30, 10, 0);
            LocalDateTime endTime = LocalDateTime.of(2024, 5, 30, 18, 0);
            LocalDate startDate = LocalDate.of(2024, 5, 30);
            LocalDate endDate = LocalDate.of(2024, 5, 30);
            String image = "spring_festival.png";
            Event event = new Event(eventName, description, startTime, endTime, startDate, endDate, image);
            //Add event
            //eventRepository.save(event);
        };
    }

}
