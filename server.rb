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
  BASE_URL = "https://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D&q=dragons"

  response = Faraday.get(BASE_URL)
  parsed_gif_data = JSON.parse(response.body)
  binding.pry

  # first_image = parsed_gif_data["data"][0]["images"]["original"]["url"]

  image_urls = []
  parsed_gif_data["data"].each do |image_hash|
    image_urls << image_hash["images"]["original"]["url"]
  end

  # giphy_client = GifsWrapper.new
  # image_urls = giphy_client.retrieive_gifs("centaurs")
  binding.pry
  content_type :json
  json(image_urls)
end

# If the path does not match any of the above routes, render the erb page.
get "*" do
  erb :home
end
