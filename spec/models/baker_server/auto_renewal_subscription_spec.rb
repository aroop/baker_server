require 'spec_helper'

module BakerServer
  describe AutoRenewalSubscription do
    it "fails validation with no subscription" do
      AutoRenewalSubscription.new(product_id: "prod_id").should have(1).error_on(:subscription)
    end

    it "fails validation with no subscription_duration" do
      AutoRenewalSubscription.new(product_id: "prod_id").should have(1).error_on(:subscription_duration)
    end
  end
end
