Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :multi_spectral_profiles
  resources :multispec, only: [:create]

  #root 'multi_spec_samples#index'
  root 'multi_spectral_samples#upload_samples'
  post 'multi_spectral_samples/upload-target' => 'multi_spectral_samples#upload_target'
  post 'multi_spectral_samples/:ms_json' => 'multi_spectral_samples#createFromJson'


  #root :to => 'multi_spec_samples#index'

  #post 'multi_spec_samples/file_upload' => 'multi_spec_samples#file_upload'
  # get 'upload/exr/:id' => 'upload#receive_exr_file'

  #get 'multispec/createFromJson" => multispec#createFromJson'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  #root 'multispec#index'

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
