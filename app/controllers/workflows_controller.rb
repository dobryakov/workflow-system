class WorkflowsController < ApplicationController

  before_action :set_workflow, only: [:show, :edit, :update, :destroy]

  def index
    if params[:workpoint_id]
      @workflows = Workpoint.find(params[:workpoint_id]).workflows
    else
      @workflows = Workflow.all
    end
    respond_to do |format|
      format.json {
        render :json => @workflows, :layout => false
      }
    end
  end

  def show
    @workflow = Workflow.find(params[:id])
    respond_to do |format|
      format.json {
        render :json => @workflow, :layout => false
      }
    end
  end

  def create
    @workflow = Workflow.new(workflow_params)

    respond_to do |format|
      if @workflow.save
        format.json { render json: @workflow.to_json.html_safe }
      else
        format.json { render json: @workflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workpoints/1
  # PATCH/PUT /workpoints/1.json
  def update
    respond_to do |format|
      if @workflow.update(workflow_params)
        format.json { render json: @workflow, :layout => false }
      else
        #format.json { render json: @workflow.errors, status: :unprocessable_entity, :layout => false }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workflow
    @workflow = Workflow.find(params[:id])
  end

  def workflow_params
    params.permit(:id, :title)
  end

end
