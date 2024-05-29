package com.example.demo.user;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @SequenceGenerator(
            name  = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1

    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_sequence"
    )
    // Database assigned ID
    private Integer ID;
    // username of user
    private String userName;
    // password of user
    private String password;
    // Is the user an admin True if they are
    private Boolean adminPowers;



    // constructors
    public User() {
    }
    public User(Boolean adminPowers, String password, String userName) {
        this.adminPowers = adminPowers;
        this.password = password;
        this.userName = userName;
    }



    //getters and setters

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getAdminPowers() {
        return adminPowers;
    }

    public void setAdminPowers(Boolean adminPowers) {
        this.adminPowers = adminPowers;
    }

    // To string
    @Override
    public String toString() {
        return "User{" +
                "ID=" + ID +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", adminPowers=" + adminPowers +
                '}';
    }


}
