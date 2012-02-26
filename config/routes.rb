BakerServer::Engine.routes.draw do
  resources :issues, except: :show do
    member do
      get "download"
    end
  end
  root :to => 'dashboard#index'
end
