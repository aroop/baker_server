module BakerServer
  class Product < ActiveRecord::Base

    validates_presence_of :product_id

    image_accessor :icon
    image_accessor :preview
    file_accessor :content

  end
end