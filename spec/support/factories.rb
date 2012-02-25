FactoryGirl.define do
  factory :issue, :class => BakerServer::Issue do
    issue_id "Issue 1"
    published_date Date.today
    summary "Issue summary goes here"
  end
end
