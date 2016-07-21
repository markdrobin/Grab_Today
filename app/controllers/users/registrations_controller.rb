class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.stores.build
    yield resource if block_given?
    respond_with resource
  end

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        # @user = User.new
        # if @store
        #   # @user = User.new(sign_up_params)
        #   # @store.name = @store[:name]
        #   # @store.update_attribute(:name, :store_attributes[:name])
        #   @store.save
        #
        #   set_flash_message! :notice, :signed_up
        #   sign_up(resource_name, resource)
        #   respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type, stores_attributes: [:name])
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :login_status, :avatar, :user_type, stores_attributes: [:id, :name])
  end

end