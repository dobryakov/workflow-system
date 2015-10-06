class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    respond_to do |format|
      format.json {
        render :json => @jobs, :layout => false
      }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    respond_to do |format|
      format.json {
        render :json => @job, :layout => false
      }
    end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        #format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :json => @job, status: :created }
      else
        #format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        #format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :json => @job, status: :ok }
      else
        #format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      #format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      if params[:attach_id]
        @job = Attach.find(params[:attach_id]).job
      else
        @job = Job.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.permit( :job_class_id )
    end
end
