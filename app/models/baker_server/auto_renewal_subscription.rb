module BakerServer
  class AutoRenewalSubscription < Product

    validates_presence_of :subscription
    validates_presence_of :subscription_duration

    belongs_to :subscription

    belongs_to :subscription_duration
  end
end