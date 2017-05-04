class Dashboard::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    if params[:type]
      @categories = Category.where(bucket_type: params[:type]).order(name: :asc).all
    else
      @categories = Category.order(name: :asc).all
    end
  end

  def show
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to [:dashboard, @category], notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to [:dashboard, @category], notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_categories_url, notice: 'Category was successfully destroyed.' }
    end
  end
  
  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      if signed_in? && current_user.admin?
        params[:category].permit(:name, :description, :bucket_type)
      end
    end
  
end
