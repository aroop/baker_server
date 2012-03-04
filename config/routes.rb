BakerServer::Engine.routes.draw do

  resources :subscriptions do
    resources :products
    resources :non_renewing_subscriptions
    resources :auto_renewal_subscriptions
    resources :free_subscriptions
  end

  resources :non_consumables

  resources :issues, except: :show do
    member do
      get "download"
    end
  end
  root :to => 'dashboard#index'
end
