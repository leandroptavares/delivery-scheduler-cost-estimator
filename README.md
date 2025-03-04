# README

## Delivery Scheduler and Cost Estimator

A Ruby on Rails mini web application developed with Rails 7.1.5.1 (ruby 3.3.5), Stimulus, and Tailwind CSS to manage deliveries, allowing users to schedule a delivery, view a summary of scheduled deliveries, and calculate the total cost.

### Important

A valid Mapbox key is needed in order to run this application.

### Setup instructions

- Set up the database (rails db:create db:migrate)
- Install dependencies (bin/bundle install)
- Create a .env file in the root directory (touch .env)
- In the .env file, store a valid Mapbox key in a MAPBOX_KEY variable (MAPBOX_KEY = your_key_here)
- Seed the database for initial data (rails db:seed)
- Open the project (bin/rails server)
- In case of styles not being applied, run bin/rails tailwindcss:watch (optional)


