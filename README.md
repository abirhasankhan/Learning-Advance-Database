# Learning-Advance-Database

## Overview
This project encompasses my advanced database lab practice during university, where I utilized PL/SQL in Oracle APEX to develop and manage complex database applications. The focus of this project was to enhance my skills in database design, querying, and PL/SQL programming.

## Features
- **PL/SQL Programming**: Developed various PL/SQL procedures, functions, and packages to handle business logic.
- **Oracle APEX**: Utilized Oracle APEX to create user-friendly web applications that interface with the database.
- **Data Management**: Implemented data manipulation operations, including CRUD (Create, Read, Update, Delete) functionalities.
- **Performance Optimization**: Applied optimization techniques to enhance query performance and ensure efficient data retrieval.

## Installation
To run this project, follow these steps:

1. Install Oracle Database and Oracle APEX on your machine.
2. Or use Oracle APEX Cloud

---

# Project: Movie Review Site

## Project Overview

This project presents the design and implementation of a comprehensive database for a movie review website. The database supports a variety of features, including user profiles, movie information, reviews, and awards, using advanced database concepts like custom data types and nested tables.

## Table of Contents
- [Project Description](#project-description)
- [Database Schema Overview](#database-schema-overview)
- [Key Features](#key-features)
- [Sample Data](#sample-data)
- [Conclusion](#conclusion)
- [How to Use](#how-to-use)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Simple Diagram Screenshot](#simple-diagram-screenshot)




## Project Description

The Movie Review Site Database is designed to support a movie review website where users can explore movies, leave reviews, and learn about the cast and crew behind their favorite films. This database covers various aspects of the movie industry including:

- User profiles and their details.
- Information on directors and actors.
- Movie production details.
- Comprehensive movie data including titles, release years, genres, and production companies.
- Movie reviews with ratings and comments.
- Awards received by movies and individuals.

## Database Schema Overview

1. **User Profiles (`Users`)**: Stores user information including personal details, email addresses, and phone numbers. Utilizes custom data types like `PhoneNumberList` and `PersonType` for efficient data management.

2. **Directors (`Directors`)**: Contains personal details of movie directors, also utilizing custom data types and nested tables for data structuring.

3. **Actors (`Actors`)**: Holds actor details using similar data structuring techniques for efficient organization.

4. **Movie Productions (`Production`)**: Information about production companies, including nested tables for founder details and phone numbers.

5. **Movies (`Movies`)**: Stores comprehensive movie data, maintaining relationships with directors and production companies through foreign keys.

6. **Movie Actors (`MovieActors`)**: Represents roles played by actors in movies, ensuring referential integrity with foreign keys to `Movies` and `Actors` tables.

7. **Movie Reviews (`Reviews`)**: Includes review IDs, movie IDs, ratings, comments, and timestamps with custom data types to ensure data integrity.

8. **Awards (`Awards`)**: Manages award information with custom data types like `AwardType` and `AwardList`.

## Key Features

- **Custom Data Types**: Utilizes advanced data types to efficiently manage complex data structures like lists of phone numbers, genres, roles, and awards.
- **Nested Tables**: Demonstrates the use of nested tables for handling multiple entities within a single table, such as multiple phone numbers or awards.
- **Referential Integrity**: Ensures data consistency through the use of foreign keys and relationships between tables.

## Sample Data

The database includes sample data for users, directors, actors, production companies, movies, movie-actor relationships, reviews, and awards to illustrate its functionality.

## Conclusion

This Movie Review Site Database serves as a robust foundation for a user-friendly and informative movie review website. It showcases the practical application of advanced database design concepts, providing a comprehensive solution for managing and querying movie-related data. This project can be a valuable resource for building movie-related websites and applications.

## How to Use

1. **Database Setup**: Import the database schema into your database management system (DBMS).
2. **Data Insertion**: Insert sample data or populate the tables with your own data.
3. **Queries**: Use SQL queries to interact with the database, retrieving movie information, user reviews, and other relevant data.

## Simple Diagram Screenshot

<img src="./Movie Review Site diagram.webp" alt="Project" />

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

We would like to thank our course instructor and teaching assistants for their guidance and support throughout this project.



