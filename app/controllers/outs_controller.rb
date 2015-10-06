class OutsController < ApplicationController
  before_action :set_out, only: [:show, :edit, :update, :destroy]

  # GET /outs
  # GET /outs.json
  def index
    if params[:workpoint_id]
      @outs = Workpoint.find(params[:workpoint_id]).outs
    else
      @outs = Out.all
    end
    respond_to do |format|
      format.json {
        render :json => @outs, :layout => false
      }
    end
  end

  # GET /outs/1
  # GET /outs/1.json
  def show
    out = Out.find(params[:id])
    respond_to do |format|
      format.json {
        render :json => out, :layout => false
      }
    end
  end

  # GET /outs/new
  def new
    @out = Out.new
  end

  # GET /outs/1/edit
  def edit
  end

  # POST /outs
  # POST /outs.json
  def create
    @out = Out.new(out_params)

    respond_to do |format|
      if @out.save
        format.json { render :json => @out, status: :created, :layout => false }
      else
        format.json { render json: @out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outs/1
  # PATCH/PUT /outs/1.json
  def update
    respond_to do |format|
      if @out.update(out_params)
        format.json { render :show, status: :ok, location: @out }
      else
        format.json { render json: @out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outs/1
  # DELETE /outs/1.json
  def destroy
    @out.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_out
      @out = Out.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def out_params
      params.permit(:id, :title, :workpoint_id, :next_workpoint_id)
    end
end
