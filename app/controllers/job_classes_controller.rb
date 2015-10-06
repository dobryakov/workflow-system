class JobClassesController < ApplicationController
  before_action :set_job_class, only: [:show, :edit, :update, :destroy]

  # GET /job_classes
  # GET /job_classes.json
  def index
    @job_classes = JobClass.all
    respond_to do |format|
      format.json {
        render :json => @job_classes, :layout => false
      }
    end
  end

  # GET /job_classes/1
  # GET /job_classes/1.json
  def show
    respond_to do |format|
      format.json {
        render :json => @job_class, :layout => false
      }
    end
  end

  # GET /job_classes/new
  def new
    @job_class = JobClass.new
  end

  # GET /job_classes/1/edit
  def edit
  end

  # POST /job_classes
  # POST /job_classes.json
  def create
    @job_class = JobClass.new(job_class_params)

    respond_to do |format|
      if @job_class.save
        #format.html { redirect_to @job_class, notice: 'Job class was successfully created.' }
        format.json { render :json => @job_class, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @job_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_classes/1
  # PATCH/PUT /job_classes/1.json
  def update
    respond_to do |format|
      if @job_class.update(job_class_params)
        #format.html { redirect_to @job_class, notice: 'Job class was successfully updated.' }
        format.json { render :json => @job_class, status: :ok }
      else
        #format.html { render :edit }
        format.json { render json: @job_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_classes/1
  # DELETE /job_classes/1.json
  def destroy
    @job_class.destroy
    respond_to do |format|
      #format.html { redirect_to job_classes_url, notice: 'Job class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_class
      if params[:job_id]
        @job_class = Job.find(params[:job_id]).job_class
      else
        @job_class = JobClass.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_class_params
      params.permit( :title )
    end
end
