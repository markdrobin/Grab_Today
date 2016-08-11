class UsersController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :owned_stores]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.find(params[:id])
    # @stores = @user.stores
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        redirect_to new_user_path
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        redirect_to 'sign_up'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.avatar = params[:avatar]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def owned_stores
    @user = User.find_by_id(params[:id])
    @stores = @user.stores
  end

  def view_orders
    @user = User.find_by_id(params[:id])
    redirect_to "/users/#{@user.id}/view_store_orders"
  end

  def cart_items
    @user = User.find_by_id(params[:id])
    @orders = @user.orders if !@user.is_owner?
    # @orders = @user.orders
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by_id(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :login_status, :user_type, :avatar)
  end
end
