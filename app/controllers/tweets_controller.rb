class TweetsController < ApplicationController

  get "/tweets" do
    @tweets = Tweet.all
    if !logged_in?
      erb :'/users/login'
    # binding.pry
    else
      erb :'/tweets/tweets'
    end
  end
end


