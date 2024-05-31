package com.example.demo.user;

import com.example.demo.Event.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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

    /**
     * Finds all events for the user to be used in events cal
     * @param ID id of student
     * @return events the student has joined
     * @throws IllegalArgumentException if the student does not exist
     */
    public Set<Event> eventsForUser(Integer ID) throws IllegalArgumentException{
        Optional<User> possibleUser = userRepository.findById(ID);
        if(possibleUser.isPresent()) {
            return possibleUser.get().getEvents();
        }else{
            throw new IllegalArgumentException("User not found");
        }

    }
}
