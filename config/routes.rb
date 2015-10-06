Rails.application.routes.draw do
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

  resources :workflows do
    resources :workpoints
  end

  resources :workpoints do
    resources :users
    resources :workflows
    resources :outs
    resources :groups
  end

  # wowolink is a link between workflow and workpoint
  resources :wowolinks

  # worker is a person (User) who works at Workpoint, @TODO optionally from "created_at" time to "deleted_at" time
  resources :workers

  # messagefact is a link between out, workpoint, user and message
  resources :messagefacts

  resources :outs

  resources :filters

  post   'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  #resources :sessions

  resources :users do
    resources :sent_messages, path: 'outbox'
    resources :received_messages, path: 'inbox'
    resources :workpoints
    resources :groups
  end

  # controller: 'users'
  # to: redirect('/users/%{id}')

  resources :messages do
    resource  :sender
    resource  :recipient
    resources :messagefacts
    resources :attaches
  end

  resources :documents
  resources :attaches do
    resource :document
    resource :job
  end

  resources :groups

  resources :jobs do
    resources :attaches
    resource  :job_class
  end

  resources :job_classes do
    resources :jobs
  end

  get 'user',        to: 'users#profile'
  get 'user/inbox',  to: 'users#inbox'
  get 'user/outbox', to: 'users#outbox'

  # work with message at workpoint
  get 'message/:message_id/compose',                 to: 'workpoints#compose'

  # TODO: switch method to post!
  get 'message/:message_id/complete-on-out/:out_id', to: 'workpoints#complete'
  get 'message/:message_id/accept-on-workpoint',     to: 'workpoints#accept'

end
