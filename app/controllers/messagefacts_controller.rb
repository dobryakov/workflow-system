class MessagefactsController < ApplicationController
  before_action :set_messagefact, only: [:show, :edit, :update, :destroy]

  # GET /messagefacts
  # GET /messagefacts.json
  def index
    if params[:message_id]
      @messagefacts = Message.find(params[:message_id]).messagefacts
    else
      @messagefacts = Messagefact.all
    end
    respond_to do |format|
      format.json {
        render :json => @messagefacts, :layout => false
      }
    end
  end

  # GET /messagefacts/1
  # GET /messagefacts/1.json
  def show
    @messagefact = Messagefact.find(params[:id])
    respond_to do |format|
      format.json {
        render :json => @messagefact, :layout => false
      }
    end
  end

  # GET /messagefacts/new
  def new
    @messagefact = Messagefact.new
  end

  # GET /messagefacts/1/edit
  def edit
  end

  # POST /messagefacts
  # POST /messagefacts.json
  def create

    # @TODO: add current user, maybe in messagefact_params method
    # messagefact_params.merge({ :user => current_user })

    @messagefact = Messagefact.new(messagefact_params.merge({ :user => current_user }))

    respond_to do |format|
      if @messagefact.save
        #format.html { redirect_to @messagefact, notice: 'Messagefact was successfully created.' }

        # TODO: refactor this shit as soon as possible
        if @messagefact.type == 'Acceptmessagefact'
          entity = @messagefact.cloned_message
        else
          entity = @messagefact
        end

        format.json { render :json => entity, status: :created, :layout => false }
      else
        #format.html { render :new }
        format.json { render json: @messagefact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messagefacts/1
  # PATCH/PUT /messagefacts/1.json
  def update
    respond_to do |format|
      if @messagefact.update(messagefact_params)
        #format.html { redirect_to @messagefact, notice: 'Messagefact was successfully updated.' }
        format.json { render :show, status: :ok, location: @messagefact }
      else
        #format.html { render :edit }
        format.json { render json: @messagefact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messagefacts/1
  # DELETE /messagefacts/1.json
  def destroy
    @messagefact.destroy
    respond_to do |format|
      #format.html { redirect_to messagefacts_url, notice: 'Messagefact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messagefact
      @messagefact = Messagefact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messagefact_params
      params.permit(:message_id, :out_id, :workpoint_id, :user_id, :type)
    end
end
