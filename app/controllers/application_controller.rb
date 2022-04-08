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
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    @user.save
    session[:user_id] = @user.id 
      redirect "/tweets"
    end
  end

  get "/login" do
    if !logged_in?
    erb :'/users/login'
    else
      redirect "/tweets"
    end
  end
  
  post "/login" do
    @user = User.find_by(:username => params[:username])
    # binding.pry
    # if @user && @user.authenticate(params[:password])
    if @user
      session[:user_id] = @user.id 
    redirect "/tweets"
   else
     redirect "/login"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    elsif !logged_in?
      redirect "/"
    else  
      redirect "/login"
    end
  end

  get "/tweets" do
    @user = User.find(session[:user_id])
    erb :'/tweets/tweets'
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
