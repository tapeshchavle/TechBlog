# TechBlog Web Application
TechBlog is a dynamic web application built to serve as a platform for tech enthusiasts to share, explore, and comment on various technology-related articles. Users can create accounts, publish blog posts, read other users’ posts, and leave comments. The application emphasizes simplicity and responsiveness, making it accessible across different devices.

# Features<br>
User Registration & Authentication:
<br>
Users can create accounts by signing up with basic details like username, email, and password.<br>
Registered users can log in securely, and session management ensures that user-specific data is available throughout the session.<br>
# Post Creation & Management:<br>

Logged-in users can create new blog posts by providing a title, description, and content. Posts are stored in a database using JDBC.
Users can also update or delete their posts as needed.<br>
# Viewing Blog Posts:<br>

All users, whether logged in or not, can browse through a list of blog posts.<br>
Posts are displayed with their titles, authors, and publishing dates, allowing users to select and view the full content of each blog.<br>
# Commenting System:<br>

Logged-in users can comment on any blog post.
The comments are displayed below each post, promoting user engagement and discussion.<br>
# Responsive Design:<br>

The UI is built with HTML, CSS, JavaScript, and Bootstrap, ensuring that the application is fully responsive across various devices, including desktops, tablets, and smartphones.<br>
# Search Functionality:<br>

Users can search for blog posts using keywords, making it easier to find specific articles related to their interests.
# Profile Management:<br>

Each user has a profile page displaying their personal information and a list of all the blog posts they have published.<br>
Users can edit their profile details, such as their bio and profile picture.<br>
# Technologies Used<br>
# Frontend:<br>

# HTML/CSS/JavaScript: The structure and styling of the pages, along with dynamic behaviors, are handled using HTML, CSS, and JavaScript.<br>
# Bootstrap: For responsive design and UI components like the navbar, buttons, and form elements.<br>
# Backend:

# Servlets: Used to handle HTTP requests, manage sessions, and implement core business logic.<br>
# JSP (JavaServer Pages): For dynamic content generation and rendering data fetched from the database to the user.<br>
# JDBC (Java Database Connectivity): To interact with the MySQL database, allowing CRUD operations on user accounts, posts, and comments.<br>
# Database:

# MySQL: The relational database used to store user information, blog posts, and comments.

# Clone the repository:

bash<br>
Copy code<br>
git clone https://github.com/tapeshchavle/TechBlog
# Setup the database:

# Create a MySQL database named techblog.
Import the provided SQL file (techblog.sql) located in the database/ directory.
# Configure the project:<br>

Update the JDBC connection parameters (URL, username, password) in the DAO classes.<br>
# Deploy the project:<br>

Deploy the project on a Tomcat server or any other servlet container.
Access the application:<br>

Open a web browser and navigate to http://localhost:8080/TechBlog to access the homepage.<br>
# Future Enhancements
Implement categories for blog posts, allowing users to filter articles based on different tech topics.<br>
Add user roles (admin, editor, user) with varying levels of access and management capabilities.<br>
Improve the comment section by allowing nested replies and reactions to individual comments.<br>
Add pagination to efficiently handle a large number of posts and comments.<br>

