class Dashboard::UsersController < ApplicationController
  before_action :require_login, only: [:index, :edit, :update, :destroy]  
  before_action :check_if_admin

  def index
    @user_count = User.count
    if params[:offset]
      @users = User.order(created_at: :asc).offset(params[:offset]).limit(30)
    else
      @users = User.order(created_at: :asc).limit(30)
    end
  end

  def show
  end

  def edit
  end
  
  private

  def user_params
    if signed_in? && current_user.admin?
      params[:user].permit(:first_name, :last_name, :active, :admin, :moderator)
    end
  end
  
end
