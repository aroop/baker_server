FactoryGirl.define do

  factory :user, :class => BakerServer::User do
    email_address "ajay@example.com"
  end

  factory :devise_token, :class => BakerServer::DeviseToken do
    token "sometoken"
  end

  factory :issue, :class => BakerServer::Issue do
    issue_id "Issue 1"
    published_date Date.today
    summary "Issue summary goes here"
  end

  factory :subscription, :class => BakerServer::Subscription do
    name "Sports Subscription"
  end

  factory :subscription_duration, :class => BakerServer::SubscriptionDuration do
    name "1 week"
  end

  factory :product, :class => BakerServer::Product do
    product_id "com.example.issue.1"
    subscription factory: :subscription
  end

  factory :non_consumable, :class => BakerServer::NonConsumable do
    product_id "com.example.issue.1"
  end

  factory :auto_renewal_subscription, :class => BakerServer::AutoRenewalSubscription do
    product_id "com.example.issue.1"
    subscription
    subscription_duration
  end

  factory :free_subscription, :class => BakerServer::FreeSubscription do
    product_id "com.example.issue.1"
    subscription
  end

  factory :non_renewing_subscription, :class => BakerServer::NonRenewingSubscription do
    product_id "com.example.issue.1"
    subscription
  end

end
