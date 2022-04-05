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

  # get "/signup" do
  #   erb :signup
  # end

  # post "/signup" do
  #   user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
  #   # binding.pry
  #     if user.save
  #       redirect "/tweets"
  #     else
  #       redirect "/signup"
  #     end
  # end

  # get '/tweets' do
  #   "Hello World"
  # end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
