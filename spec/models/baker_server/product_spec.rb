require 'spec_helper'

module BakerServer
  describe Product do
    it "fails validation with no product_id" do
      Product.new.should have(1).error_on(:product_id)
    end

  end
end
