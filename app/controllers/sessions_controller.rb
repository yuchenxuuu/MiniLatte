class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  include SessionsHelper

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
  end

  # GET /sessions/1/edit
  def edit
  end


  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Log in successfully'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
 

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    log_out
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.fetch(:session, {})
    end
end
