module BakerServer
  class UsersController < ApplicationController
    inherit_resources
    actions :all
    respond_to :html
    respond_to :json

    def create
      create! { users_path }
    end

    def update
      update! { users_path }
    end

    def destroy
      destroy! { users_path }
    end
  end
end
