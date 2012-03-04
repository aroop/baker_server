require 'spec_helper'

describe "Subscriptions" do
  describe "GET /subscriptions" do
    let!(:subscription) { Factory(:subscription) }
    before(:each) do
      visit subscriptions_path
    end

    it "should be successful" do
      page.should have_content("Listing subscriptions")
    end

    it "should have a link to create new subscription" do
      click_link("New Subscription")
      page.should have_content("New subscription")
    end

    it "should show created subscriptions" do
      page.should have_content(subscription.name)
    end

    it "should have link for editing subscriptions" do
      click_link "Edit"
      page.should have_content("Editing subscription")
    end

    it "should have link for showing subscriptions" do
      click_link "Show"
      page.should have_content("Name:")
    end

    it "should have link for deleting subscriptions" do
      pending("Need to implement this. This is working in app")
    end

    it "should have link for managing subscription products" do
      click_link "Products"
      page.should have_content("Listing products")
    end

  end

  describe "GET /subscriptions/new" do
    before(:each) do
      visit new_subscription_path
      fill_in 'Name', with: 'Sports Pgae'
      fill_in 'Description', with: 'Some description'
    end

    it "should save if the subscription is valid" do
      click_button "Create Subscription"
      page.should have_content("Subscription was successfully created.")
    end

    it "should render new template if subscription is not valid" do
      fill_in 'Name', with: nil
      click_button "Create Subscription"
      page.should have_content("Some errors were found, please take a look:")
    end

    it "should redirect to index once subscription is saved" do
      click_button "Create Subscription"
      page.should have_content("Listing subscriptions")
    end
  end
  
  describe "GET /subscriptions/edit" do
    let!(:subscription) { Factory(:subscription) }
    before(:each) do
      visit edit_subscription_path(subscription)
    end

    it "should update the subscription" do
      fill_in 'Description', with: "My New Summary"
      click_button "Update Subscription"
      subscription.reload
      subscription.description.should eq("My New Summary")
    end

    it "should redirect to index once subscription is updated" do
      click_button "Update Subscription"
      page.should have_content("Listing subscriptions")
    end
  end  

end
