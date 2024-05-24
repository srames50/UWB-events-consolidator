package com.example.demo.student;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class StudentConfig {
    @Bean
    CommandLineRunner commandLineRunner(StudentRepo studentRepository) {
        return args -> {
            Student test1 = new Student(
                    1, "Test Name", "Test ID", "TestUserName"
            );

            Student test2 = new Student(
                     "Test Name", "Test ID", "TestUserName"
            );
            studentRepository.saveAll(
                    List.of(test1,test2)
            );

        };
    }
}
