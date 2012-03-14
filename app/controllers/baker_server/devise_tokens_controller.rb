module BakerServer
  class DeviseTokensController < ApplicationController

    inherit_resources
    actions :all
    respond_to :html
    respond_to :json

    def create
      #puts "########################"
      #puts params
      #puts "########################"
      create! { devise_tokens_path }
    end

    def update
      update! { devise_tokens_path }
    end

    def destroy
      destroy! { devise_tokens_path }
    end

  end
end
