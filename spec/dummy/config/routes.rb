Rails.application.routes.draw do

  mount BakerServer::Engine => "/"
end
