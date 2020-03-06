class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  include UsersHelper
  include SessionsHelper
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  def enrolled_course
    @user = current_user
    @courses = current_user.courses.all
    if @user
      render 'my_course'
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def enroll
    if Enrollment.create(user_id: current_user.id, course_id: params[:course_id])
      flash[:success] = 'Successfully enrolled in this course'
    else
      flash[:danger] = 'The course has already been enrolled'
    end
    redirect_to enrolled_path
  end


  def drop
    e = Enrollment.where(user_id: current_user.id, course_id: params[:course_id]).first
    e.destroy
    flash[:success] = 'Successfully dropped the course'
    redirect_to enrolled_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
