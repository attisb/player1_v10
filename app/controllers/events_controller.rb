class EventsController < ApplicationController
  def index
    @events = Event.where('date >= ?', Date.today).order(date: :asc).limit(10)
  end

  def show
    @event = Event.find(params[:id])
  end
end
