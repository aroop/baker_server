BakerServer::Engine.routes.draw do

  resources :products, only: [:index] do
    collection do
      post "verify"
    end
    member do
      get "download"
    end
  end

  resources :subscriptions do
    resources :products
    resources :non_renewing_subscriptions
    resources :auto_renewal_subscriptions
    resources :free_subscriptions
  end

  resources :non_consumables

  resources :issues, except: :show
  root :to => 'dashboard#index'
end
