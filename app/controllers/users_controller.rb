# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:edit, :update, :change_role , :destroy]
  before_action :check_admin, only: [:index, :edit, :update]

  def check_admin
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    
    # Manually delete associated records
    @user.messages.update_all(user_id: nil) if @user.messages.present?    # Repeat for any other associations...

    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  def change_role
    new_role = params[:user][:role]  # Ensure you're accessing the role from the user hash
    if @user.update(role: new_role)
      redirect_to users_path, notice: "User role updated successfully."
    else
      redirect_to users_path, alert: "Failed to update user role."
    end
  end
  

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role , :password, :password_confirmation , :avatar) # Ensure role is permitted
  end
end
