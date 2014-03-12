require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite:///temperatures.db"

class Temperature < ActiveRecord::Base
end

get "/" do
  @temps = Temperature.order("created_at DESC")
  erb :index
end

post "/" do
  t = params[:temp]
  r = Temperature.new(temp_in_celsius: t)
  r.save
end
