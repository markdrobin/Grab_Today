require 'rqrcode'

class StoreProductsController < ApplicationController
  before_action :set_store_product, :load_activities, only: [:show, :edit, :update, :destroy, :restock, :process_restock]


  # GET /store_products
  # GET /store_products.json
  def index
    @store_products = StoreProduct.all
  end

  # GET /store_products/1
  # GET /store_products/1.json
  def show
    @qr = RQRCode::QRCode.new(@store_product.qr_code_path.to_s, :size => 4, :level => :h)
  end

  # GET /store_products/new
  def new
    @store_product = StoreProduct.new
  end

  # GET /store_products/1/edit
  def edit
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(1).where(recipient_id: @store_product)
  end

  def restock
    if @store_product.previous_changes.key?('stock')
      @post.create_activity(:restock, owner: current_user)
    end
  end

  def process_restock
    new_stock = params[:additional_stock]
    respond_to do |format|
      if @store_product.restock(new_stock)
        @store_product.create_activity(:restock, owner: current_user, recipient: @store_product)
        format.html { redirect_to @store_product, notice: 'Product was successfully restocked.' }
        format.json { render :show, status: :ok, location: @store_product }
      else
        format.html { render restock_store_product_path }
        format.json { render json: @store_product.errors, status: :unprocessable_entity }
      end
    end

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
    # throw @store_product.variants
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
      format.html { redirect_to store_url(@store_product.store_id), notice: 'Store product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_variant_fields
    render :partial => 'variant_form', locals: {variant: Variant.new}
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store_product
    @store_product = StoreProduct.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_product_params
    params.require(:store_product).permit(:price, :stock, :description, :avatar, :store_id, :name, :product_type, :brand, :manufacturer, variants_attributes: [:id, :name, :value])
  end
end
