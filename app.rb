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

  def create_graph
    temps = Temperature.order("created_at DESC")
    temp_hash = {}
    temps.each do |t|
      temp_hash[t.created_at] = [t.temp_in_celsius]
    end
    return temp_hash
  end

end

get "/" do
  @graph = create_graph
  @temp_now = Temperature.last
  erb :index
end

post "/" do
  t = params[:temp]
  r = Temperature.new(temp_in_celsius: t)
  r.save
end
