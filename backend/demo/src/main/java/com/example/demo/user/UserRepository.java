package com.example.demo.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    //@Query("SELECT u from User u WHERE u.userName = ? 1")
    Optional<User> findByUserName(String username);


}
