module BakerServer
  class ProductsController < ApplicationController

    inherit_resources
    actions :all
    respond_to :html
    belongs_to :subscription, parent_class: Subscription, optional: true

    def create
      create! { subscription_products_path(parent) }
    end

    def update
      update! { subscription_products_path(parent) }
    end

    def destroy
      destroy! { subscription_products_path(parent) }
    end

  end
end
