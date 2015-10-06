class AttachesController < ApplicationController
  before_action :set_attach, only: [:show, :edit, :update, :destroy]

  # GET /attaches
  # GET /attaches.json
  def index
    if params[:message_id]
      @attaches = Message.find(params[:message_id]).attaches
    else
      @attaches = Attach.all
    end
    respond_to do |format|
      format.json {
        render :json => @attaches.to_json({ :include => params[:include] }), :layout => false
      }
    end
  end

  # GET /attaches/1
  # GET /attaches/1.json
  def show
    @attach = Attach.find(params[:id])
    respond_to do |format|
      format.json {
        render :json => @attach.to_json({ :include => params[:include] }), :layout => false
      }
    end
  end

  # GET /attaches/new
  def new
    @attach = Attach.new
  end

  # GET /attaches/1/edit
  def edit
  end

  # POST /attaches
  # POST /attaches.json
  def create
    @attach = Attach.new(attach_params)

    respond_to do |format|
      if @attach.save
        #format.html { redirect_to @attach, notice: 'Attach was successfully created.' }
        format.json { render :json => @attach, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @attach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attaches/1
  # PATCH/PUT /attaches/1.json
  def update
    respond_to do |format|
      if @attach.update(attach_params)
        #format.html { redirect_to @attach, notice: 'Attach was successfully updated.' }
        format.json { render :json => @attach, status: :ok }
      else
        #format.html { render :edit }
        format.json { render json: @attach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attaches/1
  # DELETE /attaches/1.json
  def destroy
    @attach.destroy
    respond_to do |format|
      #format.html { redirect_to attaches_url, notice: 'Attach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attach
      @attach = Attach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attach_params
      params.permit( :message_id, :attachable_id, :attachable_type )
    end
end
