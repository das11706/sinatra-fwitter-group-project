class UsersController < ApplicationController

  # get "/signup" do
  #   if !logged_in?
  #   erb :'/users/create_user'
  #   else 
  #     redirect to "/tweets"
  #   end
  # end

    
  # post "/signup" do
  #   if params[:username] == "" || params[:email] == "" || params[:password] == ""
  #     redirect to '/signup'
  #   else
  #   user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
  #   user.save
  #   session[:user_id] = user.id 
  #     redirect "/tweets"
  #   end
  # end

  # get "/login" do
  #   erb :'/users/login'
  # end

  # post "/login" do
  #   user = User.find_by(:username => params[:username])
  #   # binding.pry
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id 
  #   redirect "/tweets/tweets"
  # #  else
  # #    redirect "/failure"
  #   end
  # end

  # get "/tweets" do
  #   user = User.find(session[:user_id])
  #   erb :'/tweets'
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
