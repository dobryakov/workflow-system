class MessagesController < ApplicationController

  #protect_from_forgery with: :null_session

  def index
    @messages = Message.all
    respond_to do |format|
      format.json {
        render :json => @messages, :layout => false
      }
    end
  end

  def show
    m = Message.find(params[:id])
    respond_to do |format|
      format.json {
        render :json => m, :layout => false
      }
    end
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        #format.html { redirect_to @filter, notice: 'Filter was successfully created.' }
        format.json { render :json => @message, status: :created, :layout => false }
      else
        #format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def message_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
    return json_params.permit(:content)
  end

end
