Rails.application.routes.draw do
  get 'result' => 'result#index'

  get 'speak' =>'result#show'

  get 'categories' => 'categories#index'
  get 'word_list' => 'word_list#index'
  post 'word_list' => 'word_list#index'

  namespace :admin do
    get '' => 'dashboards#index'
    get 'login' => 'sessions#new'
    post   'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
    resources :users
    resources :categories
    resources :words
    resources :wordlists
    get 'wordlists' => 'wordlists#index'
  end

  get 'followers' => 'followers#index'

  get 'followings' =>'followings#index'
   get 'password_resets/new'

  get 'password_resets/edit'

  get 'login' =>'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'

  get 'home' => 'static_pages#home'

  get 'about'=> 'static_pages#about'

  get 'help' => 'static_pages#help'

  get 'contact' => 'static_pages#contact'

  root 'static_pages#home'
  resources :users do
    resources :followings,:followers
    resources :categories do
      resources :lessons
    end

  end
  resources :categories
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :words

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
