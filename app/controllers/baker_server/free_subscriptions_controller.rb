module BakerServer
  class FreeSubscriptionsController < ProductsController
    inherit_resources
    actions :all
    respond_to :html

    defaults :resource_class => BakerServer::FreeSubscription
    belongs_to :subscription, parent_class: Subscription, optional: true

  end
end
