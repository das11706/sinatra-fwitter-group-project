class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    # binding.pry
    erb :'/users/show'
  end

  get '/signup' do
    # binding.pry
    if !logged_in?
      # binding.pry
    erb :'/users/create_user'
    else 
      redirect to "/tweets"
    end
  end

  # get '/signup' do
  #   if logged_in?
  #     redirect to "/tweets"
  #   else
  #     erb :'/users/create_user'
  #   end
  # end

  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    # binding.pry
    @user.save
    session[:user_id] = @user.id 
      redirect "/tweets"
    end
  end

  # post '/signup' do
  #   @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
  #   @user.save
  #   # session[:user_id] = @user.id 
  #   # binding.pry
  #   # @user.save
  #   # session[:user_id] = @user.id 
  #   if @user.save
  #     # binding.pry
  #     session[:user_id] = @user.id 
  #   # binding.pry
  #     redirect to '/tweets'
  #   else
  #     redirect to '/signup'
  #   end
  # end

  # post '/signup' do
  #   @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
  #   # session[:user_id] = @user.id 
  #   # binding.pry
  #   # @user.save
  #   # session[:user_id] = @user.id 
  #   if @user.save
  #     # session[:user_id] = @user.id 
  #   # binding.pry
  #     redirect to '/login'
  #   else
  #     redirect to '/signup'
  #   end
  # end

  # get '/login' do
  #   if !logged_in?
  #   erb :'users/login'
  #   else
  #     redirect to "/tweets"
  #   end
  # end

  get '/login' do
    if logged_in?
      redirect to "/tweets"
    else
      erb :'users/login'
    end
  end

  # post "/login" do
  #   @user = User.find_by(:username => params[:username])
  #   binding.pry
  #   # if @user && @user.authenticate(params[:password])
  #   if @user
  #     session[:user_id] = @user.id 
  #   redirect to "/tweets"
  #   else
  #    redirect to "/login"
  #   end
  # end

  # post "/login" do  (This is Sean's hack code)
  #   @user = User.find_by(:username => params[:username])
  #   session[:user_id] = 1
   
  #   if session[:user_id]
  #   redirect to "/tweets"
  #   else
  #    redirect to "/login"
  #   end
  # end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      # session.destroy
      session.clear
      redirect to "/login"
    else  
      redirect to "/"
    end
  end

  # get "/users/#{user.slug}" do
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/users/new' do
    @tweets = Tweet.all 
    erb :'/users/create_user'
  end


end


