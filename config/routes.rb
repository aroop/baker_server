BakerServer::Engine.routes.draw do
  resources :subscriptions do
    resources :products
  end

  resources :products

  resources :issues, except: :show do
    member do
      get "download"
    end
  end
  root :to => 'dashboard#index'
end
