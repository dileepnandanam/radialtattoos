Rails.application.routes.draw do
  root to: 'tatoos#index'
  get 'sitemap.xml', to: 'tatoos#sitemap'
  resources :tatoos do
    get :premium, on: :collection
  	get :purchase_start, on: :member
  	get :purchase_complete, on: :member
  	get :mass_upload_form, on: :collection
  	post :mass_upload, on: :collection
  	put :toggle_premium, on: :member
  	get :dashboard, on: :collection
    put :reorder, on: :collection
  end
  devise_for :users, controllers: {sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
