require 'spec_helper'

describe "Users" do
  describe "GET /baker_server_users" do
    let!(:user) { Factory(:user) }
    before(:each) do
      visit users_path
    end

    it "should be successful" do
      page.should have_content("Listing users")
    end

    it "should have a link to create new user" do
      click_link("New User")
      page.should have_content("New user")
    end

    it "should show created user" do
      page.should have_content(user.email_address)
    end

    it "should have link for editing user" do
      click_link "Edit"
      page.should have_content("Editing user")
    end

  end
end
