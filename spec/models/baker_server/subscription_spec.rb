require 'spec_helper'

module BakerServer
  describe Subscription do
    it "fails validation with no name" do
      Subscription.new.should have(1).error_on(:name)
    end

  end
end
