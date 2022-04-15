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
      if params[:content] == ""
       redirect to "/tweets/new"   
      else    
        @tweet = current_user.tweets.create(params[:tweet]) 
        redirect to "/tweets/new"
      end  
    end
  end

  # get "/tweets/:slug" do
  #   @tweet = Tweet.find_by_slug(params[:slug])
  #   erb :'/tweets/show_tweet'
  # end

end
