class StoreProductsController < ApplicationController
  before_action :set_store_product, only: [:show, :edit, :update, :destroy]
  require 'rqrcode'
  # dragonfly_accessor :qr_code
  # GET /store_products
  # GET /store_products.json
  def index
    @store_products = StoreProduct.all
  end

  # GET /store_products/1
  # GET /store_products/1.json
  def show
    @qr = RQRCode::QRCode.new( @store_product.qr_code_path.to_s, :size => 4, :level => :h )
  end

  # GET /store_products/new
  def new
    @store_product = StoreProduct.new
  end

  # GET /store_products/1/edit
  def edit
  end

  # POST /store_products
  # POST /store_products.json
  def create
    @store_product = StoreProduct.new(store_product_params)

    respond_to do |format|
      if @store_product.save
        format.html { redirect_to @store_product, notice: 'Store product was successfully created.' }
        format.json { render :show, status: :created, location: @store_product }
      else
        format.html { render :new }
        format.json { render json: @store_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_products/1
  # PATCH/PUT /store_products/1.json
  def update
    # @prod_params = {name: store_product_params[:name], product_type: store_product_params[:product_type], brand: store_product_params[:brand], manufacturer: store_product_params[:manufacturer]}
    # @store_product.product.update(@prod_params)
    respond_to do |format|
      if @store_product.update(store_product_params)
        format.html { redirect_to @store_product, notice: 'Store product was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_product }
      else
        format.html { render :edit }
        format.json { render json: @store_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_products/1
  # DELETE /store_products/1.json
  def destroy
    @store_product.destroy
    respond_to do |format|
      format.html { redirect_to store_products_url, notice: 'Store product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_product
      @store_product = StoreProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_product_params
      params.require(:store_product).permit(:price, :stock, :name, :product_type, :brand, :manufacturer, :description, :avatar, :store_id, :name, :value)
    end
end
