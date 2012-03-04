module BakerServer
  class Subscription < ActiveRecord::Base
    validates_presence_of :name
    has_many :products
  end
end
