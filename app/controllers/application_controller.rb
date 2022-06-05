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

  helpers do
    def logged_in?
      # !!session[:user_id]
      !!current_user
    end

    def current_user
      # User.find(session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      
    end
  end

end


# helpers do
#   def logged_in?
#     !!session[:user_id]
#   end

#   def current_user
#     User.find(session[:user_id])
#   end
# end