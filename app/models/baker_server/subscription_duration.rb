module BakerServer
  class SubscriptionDuration < ActiveRecord::Base
    validates_presence_of :name
    has_many :auto_renewal_subscriptions
  end
end
