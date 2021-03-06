Rails.application.routes.draw do
  devise_for :users, path_name: { sign_in: "login", sign_out: "logout" },
             controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: "users/registrations",
                           passwords: "users/passwords", sessions: "users/sessions" }

  resources :users do
    resource :profile
  end

  get '/users/:user_id/profile/delete_profile_pic' => 'profiles#delete_profile_pic'
  get '/events/:id/delete_event_pic' => 'events#delete_event_pic'
  get '/events/:id/subscriptions' => 'events#subscriptions'
  get '/events/:id/subscribers' => 'events#subscribers'
  get '/events/:id/subscribe' => 'events#subscribe'
  get '/events/:id/unsubscribe' => 'events#unsubscribe'

  resources :events do
    resources :tweets do
      put 'delete', :on => :member
    end
  end

  resources :events do
    resources :comments
  end

  resources :events do
    resources :manage_events do
      put 'delete_tweet', :on => :member
    end
  end

  resources :search_events

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

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
