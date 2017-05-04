class Dashboard::DraftsController < ApplicationController

  def index
    drink_sizes = BeerSize.where(is_draft: true, use_tap_lis: true)
    @avail_drinks = Price.where(available: true, beer_size_id: drink_sizes.ids).order_by_name
    @not_drinks = Price.where(available: false, beer_size_id: drink_sizes.ids).where.not(amount: [nil, '']).order_by_name
  end

end
