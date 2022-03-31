require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

end
