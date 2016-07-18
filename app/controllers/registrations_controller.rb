class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @store = @user.stores.build
    if @store
      # @user = User.new(sign_up_params)
      # @store.name = @store[:name]
      # @store.update_attribute(:name, :store_attributes[:name])
      @store.save
    end
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type, stores_attributes: [:name])
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :login_status, :user_type, stores_attributes: [:id, :name])
  end
end
