class VariantsController < ApplicationController
  before_action :set_variant, only: [:show, :edit, :update, :destroy]
  after_action only: [:index]

  # GET /variants
  # GET /variants.json
  def index
    # @variants = Variant.where("value like ? ", "%#{params[:q]}%")
    # respond_to do |format|
    #   format.html
    #   format.json { render :json => @variants}
    # end
    # token_list = []
    # Variant.where("value like '%#{params[:q]}%' and name = #{params[:variant_category]}").each do |var|
    #   token_list << {"id" => var.id, "name" => var.name, "value" => var.value}
    # end
    # token_list << {"name" => params[:variant_category], "value" => "-new-#{params[:q]}"}
    # render :json => token_list.to_json
    val = []
    Variant.where("value like '%#{params[:q]}%' and name = #{params[:variant_category]}").each do |e|
      e.value.split(',').each do |v|
        val << {name: v}
      end
      # val = val +
    end
    render json: val
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
  end

  # GET /variants/new
  def new
    @variant = Variant.new
  end

  # GET /variants/1/edit
  def edit
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to @variant, notice: 'Variant was successfully created.' }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1
  # PATCH/PUT /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html { redirect_to @variant, notice: 'Variant was successfully updated.' }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @variant.destroy
    respond_to do |format|
      format.html { redirect_to variants_url, notice: 'Variant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_variant
    @variant = Variant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def variant_params
    params.require(:variant).permit(:name, :value)
  end
end
