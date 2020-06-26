class CommentsController < ApplicationController
  before_action :set_params

  def index
    @comments =@group.comments.includes(:user)
    @comment =Comment.new
  end

  def create
    @comment = @group.comments.new(comment_params)
    if @comment.save
      redirect_to group_comments_path(@group)
    else
      @comments = @group.comments.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_params
    @group = Group.find(params[:group_id])
  end
end
