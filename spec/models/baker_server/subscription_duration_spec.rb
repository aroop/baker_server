require 'spec_helper'

module BakerServer
  describe SubscriptionDuration do

    it "fails validation with no name" do
      SubscriptionDuration.new.should have(1).error_on(:name)
    end

  end
end
