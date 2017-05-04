class Dashboard::EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_mod

  def index
    if params[:past]
      @events = Event.where('date < ?', Date.today).order(date: :asc).limit(30)
    else
      @events = Event.where('date >= ?', Date.today).order(date: :asc).limit(10)
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to [:dashboard, @event], notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:dashboard, @event], notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_events_url, notice: 'Event was successfully destroyed.' }
    end
  end
    
  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      if signed_in? && (current_user.admin? || current_user.moderator?)
        params[:event].permit(:title, :description, :image, :date, :category_id)
      end
    end
end
