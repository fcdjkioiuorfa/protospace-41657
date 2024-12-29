class MessagesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to '/'
  end

end
