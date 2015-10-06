class WowolinksController < ApplicationController
  before_action :set_wowolink, only: [:show, :edit, :update, :destroy]

  # GET /wowolinks
  # GET /wowolinks.json
  def index
    @wowolinks = Wowolink.all
    respond_to do |format|
      format.json {
        render :json => @wowolinks, :layout => false
      }
    end
  end

  # GET /wowolinks/1
  # GET /wowolinks/1.json
  def show
  end

  # GET /wowolinks/new
  def new
    @wowolink = Wowolink.new
  end

  # GET /wowolinks/1/edit
  def edit
  end

  # POST /wowolinks
  # POST /wowolinks.json
  def create
    @wowolink = Wowolink.find_or_create_by(wowolink_params)

    respond_to do |format|
      if @wowolink.save
        #format.html { redirect_to @wowolink, notice: 'Wowolink was successfully created.' }
        format.json { render :json => @wowolink, status: :created, :layout => false }
      else
        #format.html { render :new }
        format.json { render json: @wowolink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wowolinks/1
  # PATCH/PUT /wowolinks/1.json
  def update
    respond_to do |format|
      if @wowolink.update(wowolink_params)
        #format.html { redirect_to @wowolink, notice: 'Wowolink was successfully updated.' }
        format.json { render :json => @wowolink, status: :ok, :layout => false }
      else
        #format.html { render :edit }
        format.json { render json: @wowolink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wowolinks/1
  # DELETE /wowolinks/1.json
  def destroy
    @wowolink.destroy
    respond_to do |format|
      #format.html { redirect_to wowolinks_url, notice: 'Wowolink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wowolink
      @wowolink = Wowolink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wowolink_params
      params.permit(:workpoint_id, :workflow_id)
    end
end
