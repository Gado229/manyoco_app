class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :admin_only
  PER = 8

  def index
    @users = User.select(:id, :name, :email, :admin).order(created_at: :asc).page(params[:page]).per(PER)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "new user added"
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "User registration failed"
      render :new
    end
  end

  def show
    @tasks = Task.where(user_id: @user.id).page(params[:page]).per(PER)
  end

  def edit
  end

  def update
    if @user.update(user_params)
       flash[:success] = "update successful"
      redirect_to admin_user_path(@user), notice: 'Changed user information'
    else
      flash.now[:danger] = "update failed"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "#{@user.name}Deleted user data"
    else
      redirect_to admin_users_path, notice: "Because at least one administrator is required #{@user.name}Cannot be deleted"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to tasks_path, notice: 'You do not have access'
      flash[:danger] = "only for admins！"
    end
  end

end
