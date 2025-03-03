👋 Hi! I'm Bill, a software engineer with a passion for building cool and interesting projects. I love creating tech solutions that can help drive a business forward. This repo showcases a full-stack social media website I've been working on. Ready to dive in?

## 💡 What's the idea behind this project?

I wanted to learn and experiment with building a full-stack Ruby on Rails application. The goal was to start from scratch, using simple database requirements, and work my way through implementation and testing.

## What will you find in this repo?

**Requirements and Design** – I’ll share the initial simple tasks and design ideas before jumping into development.

**Tech Stack and Tools** – A rundown of the technologies used in this project.

**Project Structure** – A look into the folder and file organization.

**Setup Guide** – Instructions for setting up the project (and if anything doesn’t work, feel free to let me know!).

**How to Test** – Steps to test the project.

**Future Improvements** – My thoughts on how to enhance the project and some notes for the future.

## 📝 Requirements and Design
**Project Requirements**

- Users can register with their name, email, and password.
- Users can log in with their registered account.
- Users can post text.
- Users can comment on posts.

**Database Design**
![Blank diagram](https://github.com/user-attachments/assets/43a55def-e651-48ae-9b93-e4fee8efea58)


## 🛠️ Tech Stack and Tools

**Backend:** Ruby on Rails (API only)

**Frontend:** React
    
**Database:** SQLite (for development)
    
**Styling:** Basic CSS
    
**Testing:** RSpec (for backend) and manual testing with Postman

## 📂 Project Structure

### Backend Structure

**api/** - Contains all backend components

**api/app/controllers/:** Logic for the Rails app
    
**api/app/helpers/:** Custom helper methods, like auth_helpers.rb
    
**api/config/initializers/:** Custom initializers, e.g., wrap_parameters.rb
    
**api/spec/:** For tests

### Frontend Structure

**frontend/** - Contains all frontend components

**frontend/src/components/:** Components like buttons, forms, cards
    
**frontend/src/pages/:** Represents the web pages
    
**frontend/src/services/:** For API/backend calls

## 🚀 How to Set Up the Project

### Backend Setup
```bash
# Navigate to the backend directory
cd api

# Install the required gems
bundle install

# Generate a JWT secret key and add it to the `.env` file
rails secret

# Run the backend server
rails s
```

### Frontend Setup
```bash
# Navigate to the frontend directory
cd frontend

# Install frontend dependencies (using `yarn`)
yarn install

# Run the frontend server
yarn dev
```
**Tip:** Make sure both the backend and frontend are running.

## ✅ How to Test?
```bash
# Run all tests
bundle exec rspec

# Run a specific test file (example)
bundle exec rspec spec/requests/auth_controller_spec.rb

# Get a readable test output (example)
bundle exec rspec spec/requests/posts_controller_spec.rb -f doc
```

## 🚧 Future Work

1. Improve Design: I realized detailed design planning can make implementation a lot smoother.

2. Frontend Skills: Enhance the UI and make the frontend more responsive.

3. Best Practices: Learn more about tools and methods to streamline development.

4. Dependencies Management: Specify exact versions for gems and other dependencies.

### 🙏 Thank you! I'm constantly learning and working hard to improve every day. I hope you find this project interesting. If you have any feedback, I'd love to hear it!
