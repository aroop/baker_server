require "baker_server/app_store_receipt_validation.rb"

module BakerServer
  class ProductsController < ApplicationController

    inherit_resources
    actions :all
    respond_to :html
    respond_to :json, :only => [:index, :verify, :download]
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

    def verify
      file_data = params[:receipt]
      if file_data.respond_to?(:read)
        file_contents = file_data.read
      elsif file_data.respond_to?(:path)
        file_contents = File.read(file_data.path)
      else
        logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
      end
      @server_response = BakerServer::AppStoreReceiptValidation.validate(file_contents, true)
    end

    def download
      @product = BakerServer::Product.find_by_product_id params[:id]
      @download_url = "#{request.host_with_port}#{@product.content.url}"
    end

  end
end
