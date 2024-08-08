# UW-Bothell Event Consolidator Documentation
## Table of Contents
[Introduction](/README.md#1-introduction)
[Frontend](/README.md#2-frontend)
[Backend](/README.md#3-backend)
[Database](/README.md#4-database)

## 1. Introduction
### Purpose and Functionality
- Overview: 
UW-Bothell hosts numerous events ranging from academic seminars, student activities, workshops, and community gatherings. Managing these events can prove to be quite difficult, when currently there is no centralized way where students and staff can see all of these future events in one place. UW-Bothell Event Consolidator is a Flutter application designed to manage student-led events and provide a platform for user’s to login and register. An application like this can significantly improve the event management process by providing a centralized platform where users can easily view, register, and manage events.
- Key Features:
User Authentication: Secure login and registration functionality for students and admins.
Event Viewing: Users can view events on the home page or in a calendar format, to see details for each event, including time, location, and description.
Search Functionality: Users are able to search for specific events that they want to look for. 
Admin Console: Admin users have access to additional features for managing events, such as creating, editing, and deleting events.
Flutter Design: Our Mobile application is built in Flutter, so both Android and IOS systems are able to use the app. 

- Target Audience: 
Students: Individuals looking to participate in events, stay updated on upcoming activities, and register for events.
Admins/ Event Organizers: Faculty, staff, and student organizations who manage events and need a platform to list and manage event details.

Getting Started
Installation: 
Clone the repository:
`git clone https://github.com/A-Accelerator/UWB-events-consolidator.git`
Install Flutter and JDK 17. 
Install Flutter/ Dart SDK. 
(Optional / (Recommended)) : A Mobile App Emulator to run the app. 
(Optional / (Recommended)) : Visual Studio Code, with Flutter and Dart plugins
Quick Start Guide:
Run Backend: 
(In Visual Studio Code): Click the play button on the top right 
	[DemoApplication.java] under main/java/com/example/demo 
Or: `mvn spring-boot:run`
Run Frontend: 
cd frontend 
Run the Flutter app using: `flutter run`
(Verify Installation): `flutter doctor`
After running both sides: 
You should output your frontend either using browser or mobile emulator, then from the login page, use the login or registration functionality to create a new user or log in with existing credentials. 
Explore Event Management Features: 
View events, and if you are an admin, access the admin console to manage events.
	Done!

## 2. Frontend
Overview
Description: Provide a general overview of the frontend, including the technologies and frameworks used (e.g., React, Angular, Vue.js).
The frontend of our application is built using Flutter. The app features multiple pages including home.dart for the home page, login.dart for user authentication, authentication_service.dart for verifying user credentials and roles, calendar.dart for event management and the calendar page, and user_events.dart for displaying user events. Additionally, there is an admin console page that provides links to various admin functionalities like adding, editing, and deleting content. Components such as admindrawer.dart and drawer.dart offer customized navigation drawers based on admin permissions. The api_service.dart handles API calls by bridging frontend service calls with backend controllers.
Structure
File Structure: Outline the file structure of the frontend codebase.
Example:
css
Copy code
src/
├── components/
├── pages/
├── assets/
├── styles/
├── utils/
└── App.js
Components
Component Description: Describe each significant component, its purpose, and how it fits into the overall application.
Props and State: Detail the props and state management used within the components.
1. home.dart:- The `home.dart` page serves as the main page, displaying a header, search button, and a list of featured, and other events(events in the next 2 weeks). Props include the `isAdmin` flag, while state management handles loading status, the list of events, and admin status.
2. login.dart:- The `login.dart` page handles user authentication, allowing users to log in or register. Props include controllers for username and password input, while state management handles loading status and authentication responses.
3. calendar.dart:- The calendar.dart page displays a calendar with events fetched from the api service (which is a bridge for the backend controllers), allowing users to view events by selecting a date. Props include the API service instance, while state management handles the focused day, selected day, calendar format, and fetched events.
4. eventsearch.dart:- The eventsearch.dart page allows users to search for events from a predefined list fetched from an API and navigate to event details. Props include the API service instance, while state management handles the list of all events, filtered events based on search queries, and text editing controller for search input.
5. user_events.dart:- Displays events fetched from an API, handling loading states, error handling, and navigation to event details. Manages user permissions via SharedPreferences, rendering different drawers based on admin status. Features include formatted event display with date, time, and image, using Flutter's ListView for event rendering.
6. admin_console.dart:- Displays a list of events fetched from an API with options to edit, add, and delete events. Handles loading states and errors, toggles button visibility for admin actions, and provides navigation to related pages for event management.
7. drawer.dart/ admindrawer.dart:- Different app drawer components, that can be used in any page based on whether the user is an admin or not.
Routing
Router Setup: Detail the routing setup, including the primary routes and any nested routes.
Navigation: Explain how navigation is handled within the application.

## 3. Backend
Overview
Description: 
The backend of our Event Consolidator is built using Java Spring Boot, which is the framework used for building our application. Spring Boot allows us to handle all business logic for our database interactions and create API endpoints for our frontend application. We use our backend so we can manage our events, and user authentication for our frontend. 
Structure
File Structure: 
backend/
├── demo/
│   ├── .mvn/
│   ├── src/
│   │   └── main/
│   │       └── java/
│   │           └── com/
│   │               └── example/
│   │                   ├── Event/
│   │                   │   ├── Event.java
│   │                   │   ├── EventController.java
│   │                   │   ├── EventRepository.java
│   │                   │   └── EventService.java
│   │                   ├── user/
│   │                   │   ├── User.java
│   │                   │   ├── UserController.java
│   │                   │   ├── UserRepository.java
│   │                   │   └── UserService.java
│   │                   ├── DemoApplication.java
│   │                   └── WebConfig.java
│   ├── resources/
│   │   └── application.properties
API Endpoints
Endpoint List: 
Events: 
GET /event/allEvents :  Retrieve all events.
GET /event/homeEvents :  Get events for the homepage
GET /event/byId/{id} : Find an event by ID.
GET /event/byDate/{month}/{day}/{year} : Get events on a specific date.
GET /event/byNameExact/{name} : Find an event by exact name.
GET /event/byNamePartial/{search} : Find events containing a specific word/phrase.
POST /event/editImage/{id} : Edit the image of an event.
Parameters:
id (Path): ID of the event
newImage (Request Param): New image URL
POST /event/editEventName/{id} : Edit the name of an event.
Parameters:
id (Path): ID of the event
eventName (Request Param): New event name
POST /event/editDescription/{id} : Edit the description of an event.
Parameters:
id (Path): ID of the event
description (Request Param): New description
POST /event/editStartDate/{id} : Edit the start date of an event.
Parameters:
id (Path): ID of the event
startDate (Request Param): New start date
POST /event/editEndDate/{id} : Edit the end date of an event.
Parameters:
id (Path): ID of the event
endDate (Request Param): New end date
POST /event/editStartTime/{id} : Edit the start time of an event.
Parameters:
id (Path): ID of the event
startTime (Request Param): New start time
POST /event/editEndTime/{id} : Edit the end time of an event.
Parameters:
id (Path): ID of the event
endTime (Request Param): New end time
POST /event/addEvent : Register a new event.
DELETE /event/deleteEvent/{id} : Delete an event by ID.
Users:
GET /user/allUsers : Retrieve all users.
GET /user/isAdmin/{id} : Check if a user is an admin.
GET /user/userEvents/{ID} : Get the events for a user by ID.
POST /user/addUserToEvent/{userId}/{eventId} : Add a user to an event.
POST  /user/addUser :  Register a new user.

## 4. Database
Overview
For our database, we are utilizing PostgreSQL. One of the biggest benefits of PostgreSQL is its ability to create relationships between tables. This feature enables us to efficiently map the relationships between students and events, ensuring accurate and consistent data management.
Schema
Schema Diagram: Include a diagram of the database schema.

Table Descriptions: 
Events:
ID (Integer): Primary Key (Used for many to many mapping with events)
Created at (time stamp): Time and date in which the event was created
Description (varchar): A string up to 255 characters describing the event 
End_date / Start_date (date): date in which the event starts and ends
Start_time / End_Time (time stamp): Time and date in which the event starts and ends
Image (varchar):  A string up to 255 characters which is the link to the image
Event_name (varchar): A string up to 255 characters which is the name of the Event
Users:
ID (Integer): Primary Key (Used for many to many mapping with users)
Admin powers (boolean): True if the user is the admin false if they are not:
User_name (varchar):  A string up to 255 characters of the username of the user
User_name (varchar):  A string up to 255 characters of the password of the user
Users_Events (Junction table between users and events):
User id (integer): id of the user
Event id (integer): id of the event
Queries
Common Queries: Provide examples of common queries used within the application.
UserRepository Queries:
SELECT * FROM users WHERE username = :userName;
Retrieves a user based on their username.
EventRepository Queries
SELECT * FROM events WHERE id = :ID;
Finds an event by its unique ID.
SELECT e FROM Event e WHERE e.startDate BETWEEN :now AND :endOfWeek ORDER BY e.startDate, e.startTime;
Retrieves all events that occur within a specified week, sorted by start date and time.
SELECT e FROM Event e WHERE :date BETWEEN e.startDate AND e.endDate;
Gets events occurring on a specific date.
SELECT e FROM Event e WHERE e.eventName = :name;
Finds an event with an exact match to the specified event name.
SELECT e FROM Event e WHERE e.eventName LIKE %:phrase%;
Retrieves all events whose names contain a specified phrase.
DELETE FROM events WHERE id = :eventId;
Deletes an event from the database using its unique ID.
