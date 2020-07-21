class TweetsController < ApplicationController
  before_action :set_tweet,only: [:edit,:show]
  before_action :move_to_index,expect: [:index,:show]

  def index
    @tweet = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create 
    Tweet.create(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  def edit
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  def show
    @message = Message.new
    @messages = @tweet.messages.includes(:user)
  end

  private
    def tweet_params 
      params.require(:tweet).permit(:image, :tweet).merge(user_id: current_user.id)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def move_to_index
      redairect_to :index unless user_signed_in?
    end
end
