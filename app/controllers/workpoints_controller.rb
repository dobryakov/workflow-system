class WorkpointsController < ApplicationController
  before_action :set_workpoint, only: [:show, :edit, :update, :destroy]

  # GET /workpoints
  # GET /workpoints.json
  def index
    if params[:workflow_id]
      @workpoints = Workflow.find(params[:workflow_id]).workpoints
    elsif params[:user_id]
      @workpoints = User.find(params[:user_id]).workpoints
    else
      @workpoints = Workpoint.all
    end
    respond_to do |format|
      format.json {
        render :json => @workpoints, :layout => false
      }
    end
  end

  # GET /workpoints/1
  # GET /workpoints/1.json
  def show
    workpoint = Workpoint.find(params[:id])
    respond_to do |format|
      format.json {
        render :json => workpoint, :layout => false
      }
    end
  end

  # GET /workpoints/new
  def new
    @workpoint = Workpoint.new
  end

  # GET /workpoints/1/edit
  def edit
  end

  # POST /workpoints
  # POST /workpoints.json
  def create
    @workpoint = Workpoint.new(workpoint_params)

    respond_to do |format|
      if @workpoint.save
        format.json { render :json => @workpoint, status: :created, :layout => false }
      else
        format.json { render json: @workpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workpoints/1
  # PATCH/PUT /workpoints/1.json
  def update
    respond_to do |format|
      if @workpoint.update(workpoint_params)
        format.json { render :json => @workpoint, :layout => false }
      else
        #format.json { render json: @workpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workpoints/1
  # DELETE /workpoints/1.json
  def destroy
    @workpoint.destroy
    respond_to do |format|
      format.html { redirect_to workpoints_url, notice: 'Workpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # accept message by user on workpoint
  def accept

    message = Message.find(params[:message_id])
    workpoint = message.recipient_workpoint

    if message && !message.accepted? && workpoint && workpoint.users

      workpoint.accept_message(message)

      respond_to do |format|
        format.html { render :text => "Your message ACCEPTED on workpoint #{workpoint.id}", layout: false }
        format.json { render json: @message, layout: false }
      end

    end

  end

  # complete message by user on workpoint out
  def complete
    message = Message.find(params[:message_id])
    out = Out.find(params[:out_id])

    if message && !message.completed? && out && out.workpoint

      workpoint = out.workpoint

      # TODO: переписать на if message.completed, чтобы не городить тут кучу ифов,
      # и чтобы можно было доставать результаты обработки фильтрами -
      # см. Completemessagefact validation и create

      if workpoint.complete_message(message, out, current_user)
        respond_to do |format|
          format.html { render :text => "Your message COMPLETED on workpoint #{workpoint.id}, thanks!", layout: false }
          format.json { render json: @message, layout: false }
        end
      else
        respond_to do |format|
          format.html { render :text => "Your CAN NOT complete message on workpoint #{workpoint.id}", layout: false }
          format.json { render json: @message, layout: false }
        end
      end

    else
      respond_to do |format|
        format.html { render :text => "Error: you try to complete ALREADY COMPLETED message, or OUT not exists", layout: false }
        format.json { render json: @message, layout: false }
      end
    end

  end

  def compose
    @message   = Message.find(params[:message_id])
    @workpoint = @message.sender_workpoint
    @outs      = @workpoint.outs
    @workflow  = @workpoint.workflow
    @documents = @message.attaches.map{ |attach| attach.attachable }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workpoint
      @workpoint = Workpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workpoint_params
      params.permit(:id, :title, :workflow_id, {:user_ids => []})
    end
end
