class Dashboard::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :check_if_admin

  def index
    @categories = Category.where(bucket_type: 'merch').all
    if params[:category]
      @products = Product.where(category_id: params[:category]).order(name: :asc).all
    elsif params[:available] == 'yes'
        @products = Product.where(available: true).order(name: :asc).all
      elsif params[:available] == 'no'
          @products = Product.where(available: false).order(name: :asc).all
    else
      @products = Product.order(name: :asc).all
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [:dashboard, @product], notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [:dashboard, @product], notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_products_url, notice: 'Product was successfully destroyed.' }
    end
  end
    
  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      if signed_in? && current_user.admin?
        params[:product].permit(:name, :description, :image, :price, :available, :category_id)
      end
    end
end
