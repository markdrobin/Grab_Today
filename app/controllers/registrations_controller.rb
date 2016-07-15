class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @store = @user.stores.build
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type, store_attributes: [:id, :name])
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :login_status, :user_type, store_attributes: [:id, :name])
  end
end
