# Social Media Mini Project

## Introduction
Hi, I'm Bill, a passionate software engineer who loves exploring tech-driven business solutions. This repository is a small project where I built a simple social media application. It was a great learning experience, and I'm excited to share it with you!

## Project Idea
The goal of this project was to create a basic social media platform with essential features such as posting and commenting. I aimed to build it as a standalone, full-stack application using modern web development tools.

## Agenda

### How I Started
I began by defining the project's requirements and designing the database. I focused on the core features: allowing users to post content and comment on posts. Below is a quick overview of my process:
- Asked myself about the requirements and tools needed.
- Decided on features: user authentication, post creation, commenting, and basic UI.
- Designed the database (I'll add an image of the schema later).

### Tools I Used
- **Backend:** Ruby on Rails (API only)
- **Frontend:** React
- **Database:** SQLite (for development)
- **Styling:** Basic CSS
- **Testing:** RSpec (for backend) and manual testing with Postman

### Project Setup

#### Backend
```bash
cd api
bundle install
rails db:setup
rails server

```






api folder should cd to api folder for api(backend part)
`cd api`

install gem to use gem in this backend
`bundle install`

generate JWT secret key and put to `.env` file
`rails secret`

run test
`bundle exec rspec`
specific file
`bundle exec rspec spec/requests/auth_controller_spec.rb`
readable test output
`bundle exec rspec spec/requests/posts_controller_spec.rb -f doc`

run backend
`rails s`

frontend folder for frontend part, navigate to frontend folder
`cd frontend`

install dependencies of frontend (in this case I used `yarn`)
`yarn install`

run frontend
`yarn dev`

** you should run backend(api) and frontend in the same time!

