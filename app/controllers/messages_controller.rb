class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @group = Group.find(params[:group_id])

    @comment = Comment.new
    @comments = @message.comments.includes(:group)

    @youtube_url = @group.youtube_url
    @enbed_url = @youtube_url.gsub(/youtu.be/,'www.youtube.com/embed')
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path  }
        format.json
      end
    else
      @message = @group.message.includes(:user)
        flash.now[:alert] = 'メッセージを入力してください'
        render :index
    end
  end

  def update
    @message.update(message_params)
    render :index
  end

  private

  def message_params
    params.require(:message).permit(:content, :image, :check_num).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
