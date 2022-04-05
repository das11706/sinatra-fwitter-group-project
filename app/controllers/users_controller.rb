class UsersController < ApplicationController

  get "/signup" do
    erb :'/users/create_user'
  end

    
  post "/signup" do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        # binding.pry
    # if !user.username.empty? && !user.email.empty? && !user.password.empty?
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
