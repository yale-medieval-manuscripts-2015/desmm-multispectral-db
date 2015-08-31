Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :multi_spectral_profiles
  resources :multispec, only: [:create]

  root 'browse#index'

  get '/home' => 'browse#index'
  get '/index' => 'browse#index'
  get '/upload' => 'upload#uploadPage'
  get '/browse' => 'browse#browse'
  get '/continue' => 'upload#continue'
  get '/detail' => 'upload#detail'
  get '/upload/detail' => 'upload#detail'

  #get 'index' => 'browse#index'
  #get 'upload' => 'upload#uploadPage'
  #get 'browse' => 'browse#browse'

  post '/index' => 'browse#index'
  post 'uploadFile' => 'upload#uploadFile'
  post '/uploadFile' => 'upload#uploadFile'
  post '/continue' => 'upload#continue'

  #post 'multi_spec_samples/file_upload' => 'multi_spec_samples#file_upload'
  # get 'upload/exr/:id' => 'upload#receive_exr_file'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
