package com.example.demo.user;

import com.example.demo.Event.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * REST controller for handling user-related requests.
 */
@RestController
@RequestMapping("/user")
public class UserController {

    // Service to handle business logic for user operations
    private final UserService userService;

    /**
     * Constructor for UserController.
     *
     * @param userService the service to handle user operations
     */
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * Endpoint to retrieve all users.
     *
     * @return a list of all users
     */
    @GetMapping("allUsers")
    public List<User> getStudents() {
        return userService.getAllUsers();
    }

    /**
     * Endpoint to Return the events for the user by ID
     * use http://localhost:8080/user/userEvents/ID
     * FOR CONNECTING TO USER EVENT PAGE
     * @param ID of the user
     * @return List of all events the user is in
     */
    @GetMapping("/userEvents/{ID}")
    public Set<Event> getUserEvents(@PathVariable Integer ID) {
        return userService.eventsForUser(ID);
    }

    /**
     * Adds user to event
     * @param userId the user you want to add
     * @param eventId the event you want to add
     */
    @PostMapping("/addUserToEvent/{userId}/{eventId}")
    public void addUserToEvent(@PathVariable Integer userId, @PathVariable Integer eventId) {
        try {
            userService.addUserToEvent(userId, eventId);
        }catch (IllegalArgumentException e){
            System.out.println(e.getMessage());
        }
    }




    /**
     * Endpoint to register a new user.
     *USE TO TEST/ADD Invoke-RestMethod -Uri http://localhost:8080/user/addUser -Method Post -ContentType "application/json" -Body '{"userName": "john.doe","password": "secretpassword","adminPowers": false}'
     * @param user the user object to be registered
     */
    @PostMapping("/addUser")
    public void registerUser(@RequestBody User user) {
        userService.addUser(user);
    }
}
