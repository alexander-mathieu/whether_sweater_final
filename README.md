![Whether, Sweater?](/whether_sweater_screenshot.png?raw=true "Whether, Sweater?")

# Whether, Sweater?

Welcome to _Whether, Sweater?_! This is a [Turing School of Software & Design](https://turing.io/) project completed during Module 3 of the backend engineering program.

The deployed site can be viewed [here](https://brownest-field.herokuapp.com/).

Go ahead and make a user account, and see what you can do!

## About

## Requirements
 * [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby Version
 * [Rails 5.2.0](https://rubyonrails.org/) - Rails Version

## Technologies


## Installation
```
$ git clone https://github.com/alexander-mathieu/whether_sweater.git
$ cd whether_sweater
$ bundle install
```

Set up the database:
```
$ rake db:{create,migrate}
```

Additionally, you'll need:
 * An API key with [Dark Sky](https://darksky.net/dev/) and have it defined within `ENV['DARKSKY_API_KEY']`
 * An API key with [Flickr](https://www.flickr.com/services/api/) and have it defined within `ENV['FLICKR_API_KEY']`
 * An API key with [Google](https://developers.google.com/maps/documentation/embed/get-api-key) and have it defined within `ENV['GOOGLE_MAPS_API_KEY']`

 ## API Exploration
 Once installation and database setup are complete, explore the various API endpoints with the following steps:

  * From the `whether_sweater` project directory, boot up a server with `rails s`
  * Open your browser, and visit `localhost:3000/`
  * In a separate terminal window, query the available endpoints by running `rails routes`
  * Copy any of the URIs displayed and append to the `localhost:3000/` in your browser

## Running Tests
The full testing suite can be run with `$ bundle exec rspec`.

Example of expected output:
```
..............................................

Finished in 0.49113 seconds (files took 1.77 seconds to load)
46 examples, 0 failures

Coverage report generated for RSpec to /Users/alexandermathieu/turing/mod_3/projects/whether_sweater_final/coverage. 502 / 502 LOC (100.0%) covered.
```
