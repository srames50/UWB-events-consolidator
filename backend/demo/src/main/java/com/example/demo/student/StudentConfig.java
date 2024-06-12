package com.example.demo.student;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuration class for initializing student-related data.
 */
@Configuration
public class StudentConfig {

    /**
     * CommandLineRunner bean to initialize student data in the repository.
     *
     * @param studentRepository the repository to save student data
     * @return a CommandLineRunner instance
     */
    @Bean
    CommandLineRunner commandLineRunner(StudentRepo studentRepository) {
        return args -> {
            // Create a test student
            Student test2 = new Student(
                    "Test", "Test ID", "TestUserName"
            );

            // Uncomment the following line to save the test student to the repository
            // studentRepository.save(test2);
        };
    }
}
