class UserTracksController < ApplicationController
  before_action :require_login
  
  def track_had
    @track = UserHad.new(
      user_id: current_user.id,
      drink_id: params[:id]
    )
    if @track.save
      redirect_to drinks_by_name_path(params[:id]), notice: 'Awesome! Hope you liked it. Let us know by commenting below.'
    else
      redirect_to drinks_by_name_path(params[:id]), alert: 'Uh Oh! Looks like you already have liked this.'
    end
  end
  
  def not_track_had
    @track = UserHad.where(
      user_id: current_user.id,
      drink_id: params[:id]
    ).first
    if @track.destroy
      redirect_to drinks_by_name_path(params[:id]), notice: 'Success! We removed it from your list of things you\'ve had.'
    else
      redirect_to drinks_by_name_path(params[:id]), alert: 'Uh Oh! Looks like you haven\'t liked this yet.'
    end
  end
  
  def track_want
    @track = UserWant.new(
      user_id: current_user.id,
      drink_id: params[:id]
    )
    if @track.save
      redirect_to drinks_by_name_path(params[:id]), notice: 'Awesome! We\'ll create a list of things to try.'
    else
      redirect_to drinks_by_name_path(params[:id]), alert: 'Uh Oh! Looks like you already have this on your list.'
    end
  end

  def not_track_want
    @track = UserWant.where(
      user_id: current_user.id,
      drink_id: params[:id]
    ).first
    if @track.destroy
      redirect_to drinks_by_name_path(params[:id]), notice: 'Success! We removed it from your list of things you wanted to try.'
    else
      redirect_to drinks_by_name_path(params[:id]), alert: 'Uh Oh! Looks like you haven\'t tried this yet.'
    end
  end
  
  
end
