module BakerServer
  class SubscriptionsController < ApplicationController

    inherit_resources
    actions :all
    respond_to :html

    def create
      create! { subscriptions_url }
    end

    def update
      update! { subscriptions_url }
    end

    def destroy
      destroy! { subscriptions_url }
    end

  end
end
