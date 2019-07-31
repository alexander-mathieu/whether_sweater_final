![Whether, Sweater? Screenshot](/whether_sweater_screenshot.png?raw=true "Whether, Sweater? Screenshot")

# Whether, Sweater?

## About

Welcome to _Whether, Sweater?_. This is a [Turing School of Software & Design](https://turing.io/) project completed during Module 3 of the backend engineering program. _Whether, Sweater?_ is an API with endpoints that produce weather data for specific locations, meant to be consumed by a hypothetical front end, pictured above. It utilizes APIs from Google, Dark Sky and Flickr to gather relevant information, and formats it for consumption according to JSON:API specs.

The deployed site's endpoints can be consumed at:

https://whether-sweater-final.herokuapp.com/

## Endpoints

### GET /api/v1/forecast?location=denver,co

Returns the current weather for a location, as well as both 8-hour and 5-day forecasts.

Example of expected output:
```
{
    "data": {
        "id": null,
        "type": "location_forecast",
        "attributes": {
            "address": "Denver, CO, USA",
            "summary": "Partly Cloudy",
            "icon": "partly-cloudy-day",
            "date": "07-31",
            "time": "07:13PM",
            "temp": 88,
            "feels_like": 88,
            "forecast_high": 86,
            "forecast_low": 65,
            "percent_humidity": 28,
            "visibility_miles": 4.55,
            "uv_index": 9,
            "hourly_forecast": [
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                },
                {
                    "time": "07:13PM",
                    "temp": 88
                }
            ],
            "daily_forecast": [
                {
                    "day": "Wednesday",
                    "summary": "Partly Cloudy",
                    "icon": "partly-cloudy-day",
                    "percent_humidity": 28,
                    "forecast_high": 86,
                    "forecast_low": 65
                },
                {
                    "day": "Wednesday",
                    "summary": "Partly Cloudy",
                    "icon": "partly-cloudy-day",
                    "percent_humidity": 28,
                    "forecast_high": 86,
                    "forecast_low": 65
                },
                {
                    "day": "Wednesday",
                    "summary": "Partly Cloudy",
                    "icon": "partly-cloudy-day",
                    "percent_humidity": 28,
                    "forecast_high": 86,
                    "forecast_low": 65
                },
                {
                    "day": "Wednesday",
                    "summary": "Partly Cloudy",
                    "icon": "partly-cloudy-day",
                    "percent_humidity": 28,
                    "forecast_high": 86,
                    "forecast_low": 65
                },
                {
                    "day": "Wednesday",
                    "summary": "Partly Cloudy",
                    "icon": "partly-cloudy-day",
                    "percent_humidity": 28,
                    "forecast_high": 86,
                    "forecast_low": 65
                }
            ]
        }
    }
}
```

### GET /api/v1/backgrounds?location=denver,co

Returns 10 background images for a specified location.

Example of expected output:
```
{
    "data": [
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Skyline",
                "url": "https://farm66.staticflickr.com/65535/32691897517_142cb38fcf.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "City Park Pavilion",
                "url": "https://farm8.staticflickr.com/7910/40433538333_bb203ba130.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Coors Field with Downtown Denver in background",
                "url": "https://farm5.staticflickr.com/4912/39910698973_532368e033.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Downtown Denver, CO",
                "url": "https://farm5.staticflickr.com/4895/44127974920_32627f2a54.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Arapahoe Street from 14th Street, Denver",
                "url": "https://farm2.staticflickr.com/1977/45039425291_b99408e979.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Denver",
                "url": "https://farm66.staticflickr.com/65535/47949098166_30b8d34160.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "IMGP8782-Pano-Edit",
                "url": "https://farm8.staticflickr.com/7856/46649685564_e5a0d3b81e.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Illusions of Grandeur",
                "url": "https://farm5.staticflickr.com/4891/46401295491_98d36966cc.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "Faint Whispers of Hush",
                "url": "https://farm5.staticflickr.com/4901/46066276302_82c8afee42.jpg"
            }
        },
        {
            "id": null,
            "type": "background_image",
            "attributes": {
                "alt": "The Pavilion at City Park",
                "url": "https://farm2.staticflickr.com/1959/30400931657_c4241bb8f5.jpg"
            }
        }
    ]
}
```

### POST /api/v1/users

Creates a user account, using an email, password, and password_confirmation passed in as form data in the body of the request.

Request:
```
Content-Type: application/json
Accept: application/json

body:
{
  "email": "my_email@example.com",
  "password": "password"
  "password_confirmation": "password"
}
```

Example of expected output:
```
{
    "api_key": "bb4ad4d94fb2a56752ad137b2616f023"
}
```

### POST /api/v1/sessions

Authenticates a user, using an email and password passed in as form data in the body of the request.

Request:
```
Content-Type: application/json
Accept: application/json

body:
{
  "email": "my_email@example.com",
  "password": "password"
}
```

Example of expected output:
```
{
    "api_key": "bb4ad4d94fb2a56752ad137b2616f023"
}
```

### POST /api/v1/road_trip

Returns the forecast for the destination at the time of arrival, using form data passed in the body of the request.

Request:
```
Content-Type: application/json
Accept: application/json

body:
{
  "origin": "Denver,CO", 
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example of expected output:
```
{
    "data": {
        "id": null,
        "type": "road_trip_forecast",
        "attributes": {
            "origin": "Denver, CO, USA",
            "destination": "Pueblo, CO, USA",
            "trip_duration": "1 hour 47 mins",
            "summary": "Clear",
            "icon": "clear-day",
            "temp": 97,
            "feels_like": 97,
            "percent_humidity": 17,
            "visibility_miles": 9.66,
            "uv_index": 11
        }
    }
}
```

## Local Installation

### Requirements

* [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby Version
* [Rails 5.2.0](https://rubyonrails.org/) - Rails Version

### Clone

```
$ git clone https://github.com/alexander-mathieu/whether_sweater_final.git
$ cd whether_sweater_final
$ bundle install
```

### Setup Database

```
$ rake db:{create,migrate}
```

Additionally, you'll need:
* A [Dark Sky api key](https://darksky.net/dev/), and have it defined within `ENV['DARKSKY_API_KEY']`
* A [Flickr api key](https://www.flickr.com/services/api/), and have it defined within `ENV['FLICKR_API_KEY']`
* A [Google api key](https://developers.google.com/maps/documentation/embed/get-api-key/), and have it defined within `ENV['GOOGLE_MAPS_API_KEY']`

### API Exploration

Once installation and database setup are complete, explore the various API endpoints with the following steps:
* From the `whether_sweater_final` project directory, boot up a server with `$ rails s`
* Open your browser, and visit `http://localhost:3000/`
* In a separate terminal window, query the available endpoints by running `rails routes`
* Copy any of the URIs displayed and append to `http://localhost:3000/` in your browser

### Running Tests

The full test suite can be run with `$ bundle exec rspec`.

Example of expected output:
```
...........................................

Finished in 0.54859 seconds (files took 3.61 seconds to load)
43 examples, 0 failures

Coverage report generated for RSpec to /Users/alexandermathieu/turing/mod_3/projects/whether_sweater_final/coverage. 524 / 529 LOC (99.05%) covered.
```
