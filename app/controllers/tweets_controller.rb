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

  
end


