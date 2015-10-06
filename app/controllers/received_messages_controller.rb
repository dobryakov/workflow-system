class ReceivedMessagesController < ApplicationController

  def index
    u = User.find(params[:user_id])
    respond_to do |format|
      format.json {
        render :json => u.received_messages, :layout => false
      }
    end
  end

end
