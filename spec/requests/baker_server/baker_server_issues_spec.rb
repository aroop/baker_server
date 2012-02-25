require 'spec_helper'

describe "Issues" do
  describe "GET /issues" do
    let!(:issue) { Factory(:issue) }
    before(:each) do
      visit issues_path
    end

    it "should be successful" do
      page.should have_content("Listing issues")
    end

    it "should have a link to create new issue" do
      click_link("New Issue")
      page.should have_content("New issue")
    end

    it "should show created issues" do
      page.should have_content(issue.issue_id)
    end

    it "should have link for editing issue" do
      click_link "Edit"
      page.should have_content("Editing issue")
    end

    it "should have link for deleting issue", :js => true do
      pending("Fix this delete integration test")
      #Factory(:issue)
      #save_and_open_page
      #click_link "Destroy"
      #handle_js_confirm(true) { click_link "Destroy" }
      #find("#listingsTable").find("tbody").all("tr").count.should eq(0)
    end

    it "should present issues with atom format" do
      visit issues_path(format: 'atom')
      page.should have_content(issue.issue_id)
    end
  end

  describe "GET /issues/new" do
    before(:each) do
      visit new_issue_path
      fill_in 'Issue', with: 'issue_id'
      fill_in 'Summary', with: 'Some summary'
    end

    it "should save if the issue is valid" do
      click_button "Create Issue"
      page.should have_content("Issue was successfully created.")
    end

    it "should render new template if issue is not valid" do
      fill_in 'Summary', with: nil
      click_button "Create Issue"
      page.should have_content("Some errors were found, please take a look:")
    end

    it "should redirect to index once issue is saved" do
      click_button "Create Issue"
      page.should have_content("Listing issues")
    end
  end

  describe "GET /issues/edit" do
    let!(:issue) { Factory(:issue) }
    before(:each) do
      visit edit_issue_path(issue)
    end

    it "should update the issue" do
      fill_in 'Summary', with: "My New Summary"
      click_button "Update Issue"
      issue.reload
      issue.summary.should eq("My New Summary")
    end

    it "should redirect to index once issue is updated" do
      click_button "Update Issue"
      page.should have_content("Listing issues")
    end
  end

end
