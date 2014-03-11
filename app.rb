require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite:///temperatures.db"

class Temperature < ActiveRecord::Base
end

get "/" do
  @temp = Temperature.find(:last)
  erb :index
end

post "/" do
  t = params[:temp]
  r = Temperature.new(temp_in_celsius: t)
  r.save
end
