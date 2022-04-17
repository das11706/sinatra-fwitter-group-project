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
    else 
      redirect to "/login"
    end
  end
 
  get "/tweets/:id" do
    if logged_in?
    @tweet = Tweet.find_by_id(params[:id])
    # binding.pry
    erb :'/tweets/show_tweet'
    else
      redirect to "/login"
    end
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

  get "/tweets/:id/edit" do
    if logged_in?
      @tweet = Tweet.find_by(params[:content])
    erb :'/tweets/edit_tweet'
    else
      redirect "/login"
    end
  end

  get "/tweets/:id" do
    @tweet = Tweet.find_by(params[:content])
    erb :'/tweets/show_tweet'
  end

  patch '/tweets/:id' do
    if logged_in?
    @tweet = Tweet.find_by(params[:content])
    # @tweet.user.update(params["user"])
    @tweet.update(params[:tweet])
    # binding.pry
    redirect to "/tweets/#{@tweet.id}/edit"
    else
      redirect "/login"
    end
  end

  delete '/tweets/:id' do
    @tweet = Tweet.find_by(params[:content])
    @tweet.delete
    redirect to '/tweets'
  end

end


