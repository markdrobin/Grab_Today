Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, path: '', :controllers => {registrations: 'users/registrations'},
             :path_names => {:sign_in => 'sign_in', :sign_up => 'sign_up', :sign_out => 'sign_out'} do

  end
  resources :users do
    member do
      get :owned_stores
    end
  end
  resources :variants
  resources :store_products do
    collection do
      get :new_variant_fields
    end
    member do
      get :restock
      post :process_restock
    end
  end
  resources :products
  resources :stores do
    member do
      # get '/'
    end
  end

  root to: 'home#index'

  as :user do
    get 'users/:id/reset_pass' => 'users/passwords#edit'
  end

  resources :mockups do
    collection do
      get :dashboard, :sign_in, :sign_up, :stores, :store, :store_form, :product, :product_form
    end
  end

  # resources :store_products do
  #   get :autocomplete_product_brand, :on => :collection
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
