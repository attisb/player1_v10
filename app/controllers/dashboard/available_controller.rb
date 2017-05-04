class Dashboard::AvailableController < ApplicationController

  def index
    @drinks = Drink.order(:name)
  end


end
