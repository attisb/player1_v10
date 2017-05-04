class Dashboard::AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    if params[:type]
      @assets = Asset.where(type params[:asset_type]).order(name: :asc).all
    else
      @assets = Asset.order(name: :asc).all
    end
  end

  def show
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        format.html { redirect_to [:dashboard, @asset], notice: 'Asset was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to [:dashboard, @asset], notice: 'Asset was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_assets_url, notice: 'Asset was successfully destroyed.' }
    end
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      if signed_in? && current_user.admin?
        params[:asset].permit(:name, :asset_type, :content, :ad_asset_file, :menu_type)
      end
    end



end
