class UsersController < ApplicationController

  get "/signup" do
    if !logged_in?
    erb :'/users/create_user'
    else 
      redirect to "/tweets"
    end
  end

    
  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    user.save
      session[:user_id] = user.id 
    # binding.pry
    # if !user.username.empty? && !user.email.empty? && !user.password.empty?
    # user = User.find_by(:username => params[:username])
    # if user.save
    #   redirect "/tweets"
    # else
      redirect "/tweets"
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
