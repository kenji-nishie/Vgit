class CommentsController < ApplicationController
  before_action :set_group

  def index
    @messages = @group.messages.includes(:user)
    @message = Message.find(params[:message_id])
    @comment = Comment.new
    @comments = @message.comments.includes(:user)

    @youtube_url = @message.group.youtube_url
    @enbed_url = @youtube_url.gsub(/youtu.be/,'www.youtube.com/embed')
  end

  def create
    Comment.create(content: comment_params[:content],image: comment_params[:image], user_id: current_user.id,message_id:params[:message_id])
    redirect_to message_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image)
  end

  def set_group
    @group = Message.find(params[:message_id]).group
  end
end
