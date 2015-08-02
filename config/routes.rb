Rails.application.routes.draw do

  root 'books#index'
  # root 'static_pages#home'

  get 'search' => 'searches#index'

  get 'bookl' => 'static_pages#home'
  get 'about' => 'static_pages#about'

  get 'user_accounts/index'
  get 'user_accounts/new'
  get 'user_accounts/edit'
  get 'user_accounts/show'

  get 'admin' => 'user_accounts#admin_view'

  get 'repost' => 'books#repost'
  get 'books/new'
  get 'books/show'

  get 'signup' => 'user_accounts#new'  
  get 'not_logged_in' => "posts#not_logged_in"
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  
  resources :static_pages
  resources :courses
  resources :authors
  resources :user_accounts
  resources :posts
  resources :searches
  resources :books 

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
