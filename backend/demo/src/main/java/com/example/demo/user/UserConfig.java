package com.example.demo.user;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuration class for initializing user-related data.
 */
@Configuration
public class UserConfig {

    /**
     * CommandLineRunner bean to initialize user data in the repository.
     *
     * @param userRepository the repository to save user data
     * @return a CommandLineRunner instance
     */
    @Bean
    CommandLineRunner userCommandLineRunner(UserRepository userRepository) {
        return args -> {
            // Create a regular user
            User user = new User(Boolean.FALSE, "Password", "UserName");
            
            // Create a user with admin powers
            User userWithPowers = new User(Boolean.TRUE, "Password", "UserName");

            // Uncomment the following line to save the user with admin powers to the repository
            // userRepository.save(userWithPowers);
        };
    }
}
