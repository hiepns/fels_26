Rails.application.routes.draw do

  namespace :admin do
    get '' => 'dashboards#index'
    get 'login' => 'sessions#new'
    post   'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    resources :users
  end

  get 'followers' => 'followers#index'

  get 'followings' =>'followings#index'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'login'=>'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup'=>'users#new'

  get 'home' => 'static_pages#home'

  get 'about'=> 'static_pages#about'

  get 'help' => 'static_pages#help'

  get 'contact' => 'static_pages#contact'

  root 'static_pages#home'
  resources :users do
    resources :followings,:followers
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]

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
