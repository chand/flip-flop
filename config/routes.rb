Rails.application.routes.draw do

  resources :politicians do
    resources :issues
  end

  resources :issues do
    resources :politicians
  end

  resources :issues do
   resources :interests
  end

  resources :interests

  resources :politicians

  resources :legislators, only: [:index, :show]
  # resources :categories
  resources :categories, only: [:index, :show]
 # get 'graph/index'
 # get 'graph/tweet_data', :defaults => { :format => 'json' }



get '/politicians/:slug/tweet_data' => 'politicians#tweet_data', :defaults => { :format => 'json' }


get '/legislators/:id/legislator_votes' => 'legislators#legislator_votes', :defaults => { :format => 'json' }

# get '/categories/:slug' => 'categories#show'

# get '/categories/:slug/category_positions' => 'categories#category_positions', :defaults => { :format => 'json' }

get '/categories/:id/category_positions' => 'categories#category_positions', :defaults => { :format => 'json' }

# get '/legislators/:id/yes_votes' => 'legislators#yes_votes', :defaults => { :format => 'json' }

# get '/legislators/:id/no_votes' => 'legislators#no_votes', :defaults => { :format => 'json' }



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  get "pages" => 'pages#index'

  get "about" => "pages#about"

  get "politicians" => "politicians#index"

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
