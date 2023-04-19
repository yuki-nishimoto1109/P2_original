class MessagesController < ApplicationController

  def show
    @user_to = User.find(params[:id])
    @messages = Message.where("(user_id_from=#{params[:user_id]} and user_id_to=#{params[:id]}) or (user_id_to=#{params[:user_id]} and user_id_from=#{params[:id]})")
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    message.user_id_from = params[:user_id]
    message.user_id_to = params[:id]
    message.save
    redirect_to user_message_path(params[:user_id], params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
