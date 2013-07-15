class MessagesController < ApplicationController
  def index
    current_user.unread_messages.update_all({status:Message::READ})
    @messages = current_user.messages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def clear
    current_user.messages.destroy_all
    redirect_to messages_path
  end
end
