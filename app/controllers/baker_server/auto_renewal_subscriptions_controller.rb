module BakerServer
  class AutoRenewalSubscriptionsController < ProductsController
    inherit_resources

    defaults :resource_class => BakerServer::AutoRenewalSubscription
    belongs_to :subscription, parent_class: Subscription, optional: true

    actions :all
    respond_to :html

  end
end
