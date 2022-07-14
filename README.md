## External APIs

* External APIs are like Sinatra routes on someone else’s application
* Their purpose: they provide information or media that we can make HTTP requests for
* Use of external APIs is VERY common, so learning how to consume information from one is important

## Third Party API Process
* Find the API
* Look at its documentation
* Apply for a key (if required)
* Test the API endpoint with your key
* Integrate into your application with an object
  * Ideally make the request from the backend
  * Do not use fetch() if the API requires a key
* Hide the API key so that someone can snag it

## Hiding Your API Keys with Dotenv 

We use dotenv for our apps to store our api keys in local files that don't get tracked in Git.
https://github.com/bkeepers/dotenv

You will need to:
* add `dotenv` to your gemfile `gem 'dotenv'`
* require dotenv and load in your server.rb 
```ruby
require 'dotenv'
Dotenv.load
```
* create a `.env` file in the root of your project
* add a key value pair of your .env file `GIPHY_API_KEY="my-key"`
* string interpolate dotenv accessing your file `"http://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}"`

### Some APIs
Google Matrix API
https://developers.google.com/maps/documentation/distance-matrix/start

Meetup.com API
https://www.meetup.com/meetup_api/

Yelp API
https://www.yelp.com/developers/documentation/v3

Ebay API
https://developer.ebay.com/common/api/

Twitter
https://developer.twitter.com/

Instragram
https://www.instagram.com/developer/

Pokemon API
https://pokeapi.co/

Star Wars API
https://swapi.co/

Movies API
https://api.guidebox.com/

Reddit: Fun apis to play with
https://www.reddit.com/r/webdev/comments/3wrswc/what_are_some_fun_apis_to_play_with/

Gov APIs
https://www.data.gov/developers/apis

40 Useful APIs for web devs
https://www.webdesignerdepot.com/2011/07/40-useful-apis-for-web-designers-and-developers/
