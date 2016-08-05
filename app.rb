require 'sinatra'
require 'net/http'
require 'json'
require 'uri'


get '/' do
  # @name = ['Fido', 'Pongo', 'Ugo'].sample
	uri = URI.parse("http://api.zoopla.co.uk/api/v1/property_listings.json?area=Golden+Lane+Estate%2C+London+EC1Y&api_key=#{ENV["Z_KEY"]}")
	http = Net::HTTP.new(uri.host, uri.port)
	response = http.request(Net::HTTP::Get.new(uri.request_uri))
	@properties = JSON.parse(response.body)
  erb :index
end

# get '/secret' do
# 	'This is a secret page'
# end

# get '/hello' do
# 	@visitor = params[:name]
#   erb :index
# end