GGL::Application.routes.draw do




   devise_for :users
    resources :users, only: [:view_logged_out, :view_logged_in, :index, :like, :unlike] do
            resources :payments
    end
  
    resources :listings do
      resources :orders, only: [:new, :create]
      resources :edits do
        resources :proofread1s, only: [:new, :create]
        
      end
    end

  

  get "pages/home"
  get "pages/about"
  get "pages/pricing"
  get "pages/team"
  get "pages/contact"
  get "pages/testimonial"
  get "pages/orders"
  get "pages/payouts"
  get "pages/privacy"
  get "pages/terms"
  get "pages/resources"
  
  get 'requests' => "listings#requests"
  get 'dashboard' => 'users#view_logged_in'
  get 'users/:name' => 'users#view_logged_out'
  
  root 'pages#home'


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
