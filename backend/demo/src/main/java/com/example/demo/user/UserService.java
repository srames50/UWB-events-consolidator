package com.example.demo.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Service class for handling user-related operations.
 */
@Service
public class UserService {

    // Repository to handle CRUD operations on User entities
    private final UserRepository userRepository;

    /**
     * Constructor for UserService.
     *
     * @param userRepository the repository to handle user operations
     */
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Retrieves all users from the repository.
     *
     * @return a list of all users
     */
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    /**
     * Adds a new user to the repository.
     *
     * @param user the user object to be added
     */
    public void addUser(User user) {
        userRepository.save(user);
    }
}
