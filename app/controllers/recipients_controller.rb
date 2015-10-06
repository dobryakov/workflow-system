class RecipientsController < ApplicationController

  def show
    m = Message.find(params[:message_id])
    if (m && m.recipient)
      u = m.recipient
      respond_to do |format|
        format.json {
          render :json => u, :layout => false
        }
      end
    end
  end

end
