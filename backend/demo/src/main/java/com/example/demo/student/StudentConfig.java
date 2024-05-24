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

            Student test2 = new Student(
                     "Test", "Test ID", "TestUserName"
            );
            //adds Student
            //studentRepository.save(test2);
        };
    }
}
