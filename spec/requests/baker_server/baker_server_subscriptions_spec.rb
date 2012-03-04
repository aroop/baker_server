require 'spec_helper'

describe "Subscriptions" do
  describe "GET /baker_server_subscriptions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get baker_server_subscriptions_path
      response.status.should be(200)
    end
  end
end
