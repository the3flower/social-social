👋 Hi! I'm Bill, a software engineer with a passion for building cool and interesting projects. I love creating tech solutions that can help drive a business forward. This repo showcases a full-stack social media website I've been working on. Ready to dive in?
💡 What's the idea behind this project?

I wanted to learn and experiment with building a full-stack Ruby on Rails application. The goal was to start from scratch, using simple database requirements, and work my way through implementation and testing.
What will you find in this repo?

    Requirements and Design – I’ll share the initial simple tasks and design ideas before jumping into development.
    Tech Stack and Tools – A rundown of the technologies used in this project.
    Project Structure – A look into the folder and file organization.
    Setup Guide – Instructions for setting up the project (and if anything doesn’t work, feel free to let me know!).
    How to Test – Steps to test the project.
    Future Improvements – My thoughts on how to enhance the project and some notes for the future.

📝 Requirements and Design
Project Requirements

    Users can register with their name, email, and password.
    Users can log in with their registered account.
    Users can post text.
    Users can comment on posts.

Database Design

(I'll add a database design image here)
🛠️ Tech Stack and Tools

    Backend: Ruby on Rails (API only)
    Frontend: React
    Database: SQLite (for development)
    Styling: Basic CSS
    Testing: RSpec (for backend) and manual testing with Postman

📂 Project Structure
Backend Structure

api/ - Contains all backend components

    api/app/controllers: Business logic for the Rails app
    api/app/helpers: Custom helper methods, like auth_helpers.rb
    api/config/initializers: Custom initializers, e.g., wrap_parameters.rb
    api/spec: For tests

Frontend Structure

frontend/ - Contains all frontend components

    frontend/src/components: Components like buttons, forms, cards
    frontend/src/pages: Represents the web pages
    frontend/src/services: For API/backend calls