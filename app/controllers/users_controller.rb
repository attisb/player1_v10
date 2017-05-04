class UsersController < Clearance::UsersController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  
  def index
    if current_user.admin?
      # Admin
    else
      redirect_to root_path
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if current_user.id == @user.id
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to edit_user_path(current_user), notice: 'Successfully updated your information.' }
        else
          format.html { render :edit }
        end
      end
    else
      redirect_to user_path(@user.id)
    end
  end
  
  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if signed_in? && current_user.admin?
      params[:user].permit(:email, :password, :first_name, :last_name, :active, :admin, :moderator)
    else
      params[:user].permit(:email, :password, :first_name, :last_name)
    end
  end




#  def user_from_params
#     email = user_params.delete(:email)
#     password = user_params.delete(:password)
#
#     Clearance.configuration.user_model.new(user_params).tap do |user|
#       user.email = email
#       user.password = password
#     end
#   end
#
#   def user_params
#     params[Clearance.configuration.user_parameter] || Hash.new
#   end

end