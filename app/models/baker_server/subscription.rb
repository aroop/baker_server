module BakerServer
  class Subscription < ActiveRecord::Base
    validates_presence_of :name
    has_many :products, :dependent => :destroy
    has_many :auto_renewal_subscriptions
    has_many :free_subscriptions
    has_many :non_renewing_subscriptions
  end
end
