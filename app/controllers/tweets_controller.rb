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
    @users = User.all
    erb :'/tweets/new'
  end

  get "/tweets/:id" do
    @tweet = Tweet.find_by_id(params[:id])
    # binding.pry
    erb :'/tweets/show_tweet'
  end

  post "/tweets" do
    if logged_in?
    if params[:content] == "" 
     redirect to "/tweets/new"
    else
      @tweet = Tweet.create(params[:tweet])
      @user = Tweet.find_by(params[:username])  
      @tweet.user_id = @user.id
      @tweet.save
    end
    redirect to "/tweets/:slug"
    end  
  end


  get "/tweets/:slug" do
    @tweet = Tweet.find_by_slug(params[:slug])
    erb :'/tweets/show'
  end
 
end


