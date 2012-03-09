module BakerServer
  class Product < ActiveRecord::Base

    validates_presence_of :product_id

    image_accessor :icon
    image_accessor :preview
    file_accessor :content

    scope :subscriptions, where("subscription_id is not null")
    scope :products, where("subscription_id is null")

  end
end
