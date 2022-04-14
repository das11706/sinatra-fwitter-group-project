class TweetsController < ApplicationController
  
  get "/tweets" do
    @tweets = Tweet.all
    # binding.pry 
    if !logged_in?
    #   erb :'/users/login'
      redirect to "/login"
    else
      erb :'/tweets/tweets'
    end
  end

  get "/tweets/new" do
    if logged_in?
      # binding.pry
    @users = User.all
    erb :'/tweets/new'
    end
  end

  get "/tweets/:id" do
    @tweet = Tweet.find_by_id(params[:id])
    # binding.pry
    erb :'/tweets/show_tweet'
  end

  post "/tweets" do
    if logged_in?  
      if @tweet = Tweet.find_by(params[:content]) == nil
       redirect to "/tweets/new"   
      else    
        @tweet = Tweet.create(params[:tweet])
        @user = User.create(username: params["username"], email: params["email"], password_digest: params["password"])
        @tweet = Tweet.find_by(params[:content])
        @user = Tweet.find_by(params[:username])  
        @tweet.user_id = @user.id
        @tweet.save
      redirect to "/tweets/:slug"
      end  
    end  
  end

  get "/tweets/:slug" do
    @tweet = Tweet.find_by_slug(params[:slug])
    erb :'/tweets/show'
  end
 
end


