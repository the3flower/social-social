# social-social

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

