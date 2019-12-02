class MessagesController < ApplicationController
  def create
  	@message = Message.new(msg_params)
 
  	@message.save
  	redirect_to group_path(Group.find(@message[:group_id]))
  end
  private
    def msg_params
      params.require(:message).permit(:title, :text, :user_id, :group_id)
    end
end
