class Dashboard::PagesController < ApplicationController
  before_action :require_login
  before_action :check_if_mod
  
  def index
    @user_counts = User.count
    @user_admin_counts = User.where(:admin => true).count
    @user_mod_counts = User.where(:moderator => true).count
  end
  
  def screen
  end
    
end
