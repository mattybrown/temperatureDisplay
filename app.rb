require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite:///temperatures.db"

class Temperature < ActiveRecord::Base
end

get "/" do
  @temp = Temperature.find(:last)
  erb :index
end

get "/:temp" do
  @temp = params[:temp]
end
