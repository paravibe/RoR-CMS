Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'front#page'

  # Users.
  get 'users' => 'users#index'
  match 'user/:action' => 'users#:action', :via => [:get, :post, :patch]
  match 'user/:id/:action' => 'users#:action', :via => [:get, :post, :patch]
  match 'user/:id/profile/:action' => 'profiles#:action', :via => [:get, :post, :patch]

  # Roles.
  get 'roles' => 'roles#index'
  match 'role/:action' => 'roles#:action', :via => [:get, :post, :patch]
  match 'role/:id/:action' => 'roles#:action', :via => [:get, :post, :patch]

  # Nodes.
  get 'nodes' => 'nodes#index'
  match 'node/:action' => 'nodes#:action', :via => [:get, :post, :patch]
  match 'node/:id/:action' => 'nodes#:action', :via => [:get, :post, :patch]


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

  # match ':controller(/:action(/:id))', :via => [:get, :post, :patch]
end
