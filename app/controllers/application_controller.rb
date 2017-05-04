class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def cities
    render json: State.where(country_id: params[:state]).to_json
  end  

  protected
    def check_if_admin
      redirect_to root_path unless signed_in? && current_user.admin?
    end

    def check_if_mod
      redirect_to root_path unless signed_in? && (current_user.admin? || current_user.moderator?)
    end

end
