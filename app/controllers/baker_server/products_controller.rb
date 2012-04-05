require "baker_server/app_store_receipt_validation.rb"

module BakerServer
  class ProductsController < ApplicationController

    inherit_resources
    actions :all
    respond_to :html
    respond_to :json, :only => [:index, :verify, :download]
    belongs_to :subscription, parent_class: Subscription, optional: true

    has_scope :subscriptions, :type => :boolean
    has_scope :products, :type => :boolean

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
      subscription  = !BakerServer::NonConsumable.exists?(:name => params[:productIdentifier])
      file_contents = read_receipt(params[:receipt])
      user          = BakerServer::User.find_by_id_and_password(params[:user_id], params[:user_password])
      if subscription
        @server_response = ::BakerServer::AppStoreReceiptValidation.validate_subscription(file_contents, true)
        json = ActiveSupport::JSON.decode(@server_response)
        puts ['original_purchase_date_pst', 'original_transaction_id', 'expires_date', 'transaction_id', 'quantity',
         'product_id', 'web_order_line_item_id', 'item_id', 'expires_date_formatted', 'purchase_date', 'purchase_date_ms',
         'expires_date_formatted_pst', 'purchase_date_pst', 'original_purchase_date', 'original_purchase_date_ms'].collect{|e|json['receipt'][e]}.join("\t")
        puts ['original_purchase_date_pst', 'original_transaction_id', 'expires_date', 'transaction_id', 'quantity',
        'product_id', 'web_order_line_item_id', 'item_id', 'expires_date_formatted', 'purchase_date', 'purchase_date_ms',
        'expires_date_formatted_pst', 'purchase_date_pst', 'original_purchase_date', 'original_purchase_date_ms'].collect{|e|json['latest_receipt_info'][e]}.join("\t")
      else
        @server_response = ::BakerServer::AppStoreReceiptValidation.validate_non_consumable(file_contents, true)
      end
    end

    def download
      @product      = BakerServer::Product.find_by_product_id params[:product_identifier]
      @download_url = @product.content.url
    end

    private
    def read_receipt(file_data)
      if file_data.respond_to?(:read)
        return file_data.read
      elsif file_data.respond_to?(:path)
        return File.read(file_data.path)
      else
        logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
      end
    end

  end
end