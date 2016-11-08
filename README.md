# New Rails Template

### This is my template for creating a new rails app

#### History

* Rails 5.0
* Ruby 2.3.1

I created this template to work for every new Rails project I could possibly need. It replaces the Gemfile with one of my own, along with:
  * uses a Postgresql database
  * removes Minitest and installs RSpec
  * installs Bootstrap gem and all additional configurations
  * installs devise and sets up User class
  * includes ActiveAdmin with that User class
  * replaces annotate defaults for all models
  * uses slim and replaces application.html with slim file
  * initializes git and commits new project


#### Installation

1. Create a new folder to hold your projects

2. Clone this project into that folder

3. In your terminal, run: `rails new ProjectName -m new_rails_template.rb`

4. Once the template is finished running, you will need to create the database and migrate:
```
rake db:create
db:migrate
```

#### Usage

To user CodeClimate and Travis CI in your projects, follow these steps:

###### CODECLIMATE

* Make sure you have an account on [CodeClimate](codeclimate.com)

* Go to CodeClimate dashboard and click 'Add Open Source Repo'

* Type in Repo name and select

* Once the build is complete, click continue to results

* CodeClimate will generate a .codeclimate.yml file, and you will also need .rubocop.yml and .eslintrc

* On CodeClimate dashboard, hover over project name and click settings

* Select integrations

* Edit GitHub Pull Requests

* Go to your GutHub page and go to Settings > Webhooks & Services

* Add CodeClimate Webhook - (https://codeclimate.com/webhooks)

* select 'Send me everything'

* Generate a GitHub OAuth Token and name that token whatever you'd like

* Copy the token and paste in CodeClimate integrations

* Click save and then click 'Test Services' to make sure it is working

###### TRAVIS CI

* From CodeClimate dashboard, hover over project and select settings

* click on 'Test Coverage' on right hand side

* get your repo-token from [Travis](https://travis-ci.org/) and place it in the travis.yml file

* run
* ```
bundle exec rspec
bundle exec codeclimate-test-reporter
```
  and your testing environment is good to go!

Happy coding!
