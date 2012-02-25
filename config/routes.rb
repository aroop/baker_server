BakerServer::Engine.routes.draw do
  resources :issues, except: :show
  root :to => 'dashboard#index'
end
