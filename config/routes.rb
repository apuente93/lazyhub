Lazyhub::Application.routes.draw do
  resources :subscriptions, :only => [:new, :create]

  resources :articles do
    member do 
       post :views
       get :views
       put "like", to: "articles#upvote"
       put "dislike", to: "articles#downvote"
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :comments, only: [:create, :destroy]
  
  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/game',    to: 'static_pages#game',    via: 'get'
  match '/laugh',    to: 'static_pages#laugh',    via: 'get'
  match '/news',    to: 'static_pages#news',    via: 'get'
  match '/tech',    to: 'static_pages#tech',    via: 'get'
  match '/social',    to: 'static_pages#social',    via: 'get'
  match '/sports',    to: 'static_pages#sports',    via: 'get'
  match '/random',    to: 'static_pages#random',    via: 'get'
  match '/about',    to: 'static_pages#about',    via: 'get'
  match '/articles/:id/like(.:format)',    to: 'articles#upvote',    via: 'get'
  match '/articles/:id/dislike(.:format)',    to: 'articles#downvote',    via: 'get'
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:

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
