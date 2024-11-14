# app/controllers/admin_controller.rb
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user, only: [ :edit_user, :update_user ]

  def dashboard
    @users = User.all
    @students = User.students # only users with the role of "student"
  end

  def index_users
    @users = User.all
  end

  def edit_user
    @user
  end

  def update_user
    if @user.update(user_params)
      redirect_to admin_dashboard_path, notice: "User updated successfully."
    else
      render :edit_user
    end
  end

  def messages
    @messages = Message.all # Assuming you have a Message model for contact form messages
  end

  def view_messages
    @messages = Contact.all
  end

  private

  def check_admin
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
