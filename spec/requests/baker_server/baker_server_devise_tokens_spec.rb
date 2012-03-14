require 'spec_helper'

describe "DeviseTokens" do
  describe "GET /baker_server_devise_tokens" do
    let!(:devise_token) { Factory(:devise_token) }
    before(:each) do
      visit devise_tokens_path
    end

    it "should be successful" do
      page.should have_content("Listing Devise tokens")
    end

    it "should have a link to create new devise token" do
      click_link("New Devise token")
      page.should have_content("New Devise token")
    end

    it "should show created devise token" do
      page.should have_content(devise_token.token)
    end

    it "should have link for editing devise token" do
      click_link "Edit"
      page.should have_content("Editing Devise token")
    end

  end
end
