require 'spec_helper'

module BakerServer
  describe NonRenewingSubscription do

    it "fails validation with no subscription" do
      NonRenewingSubscription.new(product_id: "prod_id").should have(1).error_on(:subscription)
    end

  end
end
