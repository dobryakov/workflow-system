class SessionsController < ApplicationController

  #protect_from_forgery with: :null_session

  def new
  end

  def create
    session[:abc] = 'def'
    sp = session_params
    login = sp['login']
    password = sp['password']
    user = User.authenticate(login, password)
    if user
      session[:user_id] = user.id
#     redirect_to user
      render :json => user, :layout => false
    else
      render :json => [], :layout => false, :status => 401
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => [], :layout => false, :status => 200
    #redirect_to root_url, :notice => "Logged out!"
  end

  def session_params
    json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
    return json_params.permit(:login, :password)
  end

end