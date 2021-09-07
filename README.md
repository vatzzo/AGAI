# AGAI
## Web application for planning and managing learning stages for new activities and sharing them within the website

### Setting up the project
Follow these steps to get our service running on you computer.

1. The Docker should be installed on your system. You can follow [the instruction](https://docs.docker.com/engine/install/) provided by Docker Team.

2. Building the app with Docker
In terminal, type the following commands:

  `docker compose build app` &rarr; builds an image

  `docker compose run app bash`&rarr; opens bash terminal

  `rails db:create db:migrate db:seed`&rarr; creates database, runs the migrations, and makes seeds which are required.

  **Then exit the bash console and run:**

  `docker compose up` &rarr; composes the containers and runs the application

3. Running tests
Attach new shell and type the following command in the terminal:

  `bundle exec rspec -fd` &rarr; runs tests
