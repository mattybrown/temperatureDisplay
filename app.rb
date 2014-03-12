require "sinatra"
require "sinatra/activerecord"
require "chartkick"


set :database, "sqlite:///temperatures.db"

class Temperature < ActiveRecord::Base
end

helpers do
  def pretty_date(time)
    time.strftime("%T %d %b %Y")
  end
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
