package com.example.demo.user;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UserConfig {

    @Bean
    CommandLineRunner userCommandLineRunner(UserRepository userRepository) {
        return args -> {
            User user = new User(Boolean.FALSE, "Password", "UserName");
            User userWithPowers = new User(Boolean.TRUE, "Password", "UserName");
            //userRepository.save(userWithPowers);
        };
    }
}
