%w(sinatra haml sinatra/activerecord ./config/environments).each do |lib|
  require lib
end

get '/' do
  haml :index
end