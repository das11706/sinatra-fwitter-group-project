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
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    @user.save
    session[:user_id] = @user.id 
      redirect "/tweets"
    end
  end

  get "/login" do
    if !logged_in?
    erb :'users/login'
    else
      redirect to "/tweets"
    end
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    # binding.pry
    # if @user && @user.authenticate(params[:password])
    if @user
      session[:user_id] = @user.id 
    redirect to "/tweets"
   else
     redirect to "/login"
    end
  end

  get "/logout" do
    if logged_in?
      # session.destroy
      session.clear
      redirect to "/login"
    else  
      redirect to "/"
    end
  end

  get '/users' do
    @users = User.all
    # binding.pry
    erb :'/users/show'
  end

  # get "/users/#{user.slug}" do
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/users/new' do
    @tweets = Tweet.all 
    erb :'/users/create_user'
  end


end
