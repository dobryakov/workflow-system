class SentMessagesController < ApplicationController

  def index
    u = User.find(params[:user_id])
    respond_to do |format|
      format.json {
        render :json => u.sent_messages, :layout => false
      }
    end
  end

end
