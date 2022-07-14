require "sinatra"
require "sinatra/json"
require "json"
require "sinatra/reloader" if development?
require "pry" if development? || test?
# ---------------------------------------------------------------------
require "faraday"
require 'dotenv'
Dotenv.load
# ------------------------------------------------------------------
require_relative "./models/gifs_wrapper.rb"

set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

before do
  headers({ "Access-Control-Allow-Origin" => "*" })
end

# -----------------------------------------------------------------

get "/" do
  erb :home
end

get "/api/v1/gifs" do
  BASE_URL = "http://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}"

  # response = Faraday.get("...")
  # parse the response
  # grab the data we want, exclude the rest
  # parsed_response = JSON.parse(response.body)
  # image_urls = []

  # stuff = GifsWrapper.new.retrieive_gifs("cats")
  # consider refactoring
  content_type :json
  json image_urls
end

# If the path does not match any of the above routes, render the erb page.
get "*" do
  erb :home
end
