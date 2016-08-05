class StoreOrderItemsController < ApplicationController
  before_action :set_store_order_item, only: [:show, :edit, :update, :destroy]

  # GET /store_order_items
  # GET /store_order_items.json
  def index
    @store_order_items = StoreOrderItem.all
  end

  # GET /store_order_items/1
  # GET /store_order_items/1.json
  def show
  end

  # GET /store_order_items/new
  def new
    @store_order_item = StoreOrderItem.new
  end

  # GET /store_order_items/1/edit
  def edit
  end

  # POST /store_order_items
  # POST /store_order_items.json
  def create
    @store_order_item = StoreOrderItem.new(store_order_item_params)

    respond_to do |format|
      if @store_order_item.save
        format.html { redirect_to @store_order_item, notice: 'Store order item was successfully created.' }
        format.json { render :show, status: :created, location: @store_order_item }
      else
        format.html { render :new }
        format.json { render json: @store_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_order_items/1
  # PATCH/PUT /store_order_items/1.json
  def update
    respond_to do |format|
      if @store_order_item.update(store_order_item_params)
        format.html { redirect_to @store_order_item, notice: 'Store order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_order_item }
      else
        format.html { render :edit }
        format.json { render json: @store_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_order_items/1
  # DELETE /store_order_items/1.json
  def destroy
    @store_order_item.destroy
    respond_to do |format|
      format.html { redirect_to store_order_items_url, notice: 'Store order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_order_item
      @store_order_item = StoreOrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_order_item_params
      params.require(:store_order_item).permit(:price, :quantity)
    end
end
