module BakerServer
  class NonRenewingSubscriptionsController < ProductsController
    inherit_resources
    actions :all
    respond_to :html

    defaults :resource_class => BakerServer::NonRenewingSubscription
    belongs_to :subscription, parent_class: Subscription, optional: true
  end
end
