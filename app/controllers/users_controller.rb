class UsersController < ApplicationController

  #protect_from_forgery with: :null_session

  def index
    if params[:workpoint_id]
      @users = Workpoint.find(params[:workpoint_id]).users
    else
      @users = User.all
    end
    respond_to do |format|
      format.json {
        render :json => @users.each { |u| u.filtered }, :layout => false
      }
    end
  end

  def show
    u = User.find(params[:id])
    session[:abc] = 'def'
    respond_to do |format|
      format.json {
        render :json => u.filtered, :layout => false
      }
    end
  end

  def new
    @user = User.new
  end

  def create
    u = User.new(user_params)
    if u.save
      redirect_to u
    else
      #render "new"
    end
  end

  def destroy
    u = User.find(params[:id])
    if u.destroy
      respond_to do |format|
        format.json {
          render :json => {}, :layout => false
        }
      end
    end
  end

  def profile
    if current_user
      render :json => current_user.filtered, :layout => false
    else
      render :json => {}, :layout => false, :status => 401
    end
  end

  def inbox
    if current_user
      #render :json => current_user.received_messages.as_json({ :include => { :recipient_workpoint => {}, :sender => { :except => [:password_salt, :password_hash] } } }), :layout => false
      render :json => current_user.received_messages.as_json({ :include => params[:include] }), :layout => false
    else
      render :json => [], :layout => false, :status => 401
    end
  end

  def outbox
    if current_user
      render :json => current_user.sent_messages.as_json({ :include => params[:include] }), :layout => false
    else
      render :json => [], :layout => false, :status => 401
    end
  end

  private

  def user_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
    return json_params.permit(:login, :password)
  end

end
