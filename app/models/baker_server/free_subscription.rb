module BakerServer
  class FreeSubscription < Product
    validates_presence_of :subscription
    belongs_to :subscription
  end
end