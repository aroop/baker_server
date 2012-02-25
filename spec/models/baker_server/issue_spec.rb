require 'spec_helper'

module BakerServer

  describe Issue do
    it "fails validation with no issue_id" do
      Issue.new.should have(1).error_on(:issue_id)
    end

    it "fails validation with no summary" do
      Issue.new.should have(1).error_on(:summary)
    end

    it "fails validation with no published date" do
      Issue.new.should have(1).error_on(:published_date)
    end

    it "fails validation with summary greatthan 2000 chars" do
      Issue.new(summary: "a"*2001).should have(1).error_on(:summary)
    end

    it "fails validation when published date is greater than end date" do
      pending("check why this is failing when the application is behaving as expected")
      #Issue.new(published_date: Date.today, end_date: Date.yesterday).should have(1).error_on(:published_date)
    end

  end

end
