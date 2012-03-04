require 'spec_helper'

describe "NonConsumables" do
  describe "GET /non_consumables" do
    let!(:non_consumable) { Factory(:non_consumable) }
    before(:each) do
      visit non_consumables_path
    end

    it "should be successful" do
      page.should have_content("Listing Non Consumables")
    end

    it "should have a link to create new non_consumable" do
      click_link("New Product")
      page.should have_content("New Non Consumable")
    end

    it "should show created non_consumables" do
      page.should have_content(non_consumable.product_id)
    end

    it "should have link for editing non_consumables" do
      click_link "Edit"
      page.should have_content("Editing Non Consumable")
    end

    it "should have link for showing non_consumables" do
      click_link "Show"
      page.should have_content("Name:")
    end

    it "should have link for deleting non_consumables" do
      pending("Need to implement this. This is working in app")
    end

  end

  describe "GET /non_consumables/new" do
    before(:each) do
      visit new_non_consumable_path
      fill_in 'Product ID', with: 'com.example.issue.1'
      fill_in 'Name', with: 'Product Name'
    end

    it "should save if the product is valid" do
      click_button "Create Non consumable"
      page.should have_content("Non consumable was successfully created.")
    end

    it "should render new template if non_consumable is not valid" do
      fill_in 'Product ID', with: nil
      click_button "Create Non consumable"
      page.should have_content("Some errors were found, please take a look:")
    end

    it "should redirect to index once subscription is saved" do
      click_button "Create Non consumable"
      page.should have_content("Listing Non Consumables")
    end
  end
  
  describe "GET /non_consumables/edit" do
    let!(:non_consumable) { Factory(:non_consumable) }
    before(:each) do
      visit edit_non_consumable_path(non_consumable)
    end

    it "should update the non consumable" do
      fill_in 'Name', with: "My New name"
      click_button "Update Non consumable"
      non_consumable.reload
      non_consumable.name.should eq("My New name")
    end

    it "should redirect to index once non consumable is updated" do
      click_button "Update Non consumable"
      page.should have_content("Listing Non Consumables")
    end
  end  

end
