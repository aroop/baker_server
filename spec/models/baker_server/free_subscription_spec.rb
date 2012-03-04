require 'spec_helper'

module BakerServer
  describe FreeSubscription do

    it "fails validation with no subscription" do
      FreeSubscription.new(product_id: "prod_id").should have(1).error_on(:subscription)
    end

  end
end
