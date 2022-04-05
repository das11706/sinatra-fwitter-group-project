class UsersController < ApplicationController

  get "/signup" do
    erb :'/users/create_user'
  end

    
  post "/signup" do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = user.id 
    # binding.pry
    # if !user.username.empty? && !user.email.empty? && !user.password.empty?
    # user = User.find_by(:username => params[:username])
    if user.save
      redirect "/tweets"
    else
      redirect "/signup"
    end
  end

  helpers do
    def logged_in?
     !!session[:user_id]
    end  
    
    def current_user
      User.find(session[:user_id])
    end
  end

end
