package com.example.demo.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository interface for User entity.
 * Extends JpaRepository to provide CRUD operations on User entities.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    /**
     * Custom query method to find a user by their ID.
     *
     * @param username the username to search for
     * @return an Optional containing the found User, or empty if not found
     */
    Optional<User> findByUserName(String username);


}
