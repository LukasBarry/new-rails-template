# New Rails Template

### This is my template for creating a new rails app

###### Usage

* Rails 5.0
* Ruby 2.3.1

I created this template to work for every new Rails project I could possibly need. It replaces the Gemfile with one of my own, along with:
  * uses a postgresql database
  * removes minitest and installs rspec
  * installs Bootstrap gem and all additional configurations
  * installs devise and sets up User class
  * includes activeadmin with that User class
  * replaces annotate defaults for all models
  * uses slim and replaces application.html with slim file
  * initializes git and commits new project


###### Installation

1. Create a new folder to hold your projects

2. Clone this project into that folder

3. In your terminal, run: `rails new ProjectName -m new_rails_template.rb`

4. Once the template is finished running, you will need to create the database and migrate:
```
  rake db:create
  rake db:migrate
```

Happy coding!
