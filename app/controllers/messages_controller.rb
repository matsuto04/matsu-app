class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to "/tweets/#{message.tweet.id}"
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id,tweet_id: params[:tweet.id])
  end
end
