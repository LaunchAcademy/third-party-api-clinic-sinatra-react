require "sinatra"
require "sinatra/json"
require "json"
require "sinatra/reloader" if development?
require "pry" if development? || test?
# ---------------------------------------------------------------------
require "faraday"
# ------------------------------------------------------------------
set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

require_relative "gifs_wrapper"

CURRENT_FILE_PATH = File.dirname(__FILE__)

before do
  headers({ "Access-Control-Allow-Origin" => "*" })
end

# -----------------------------------------------------------------

get "/" do
  erb :home
end

get "/api/v1/gifs" do
  # BASE_URL = "http://api.giphy.com/v1/gifs/search?api_key=YJX6Vs4kayAeOM4etN7P5ueL4ie4wU5D"
  query = "steven-universe"
  # response = Faraday.get("#{BASE_URL}&q=#{query}")
  #
  # parsed_response = JSON.parse(response.body)
  # image_urls = []
  # parsed_response["data"].each do |gif|
  #   image_urls<< gif["images"]["preview_gif"]["url"]
  # end
  gifs_wrapper = GifsWrapper.new
  image_urls = gifs_wrapper.retrieive_gifs(query)

  content_type :json
  json image_urls
end

# If the path does not match any of the above routes, render the erb page.
get "*" do
  erb :home
end
