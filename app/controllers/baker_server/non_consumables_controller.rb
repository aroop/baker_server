module BakerServer
  class NonConsumablesController < ProductsController

    inherit_resources
    defaults :resource_class => BakerServer::NonConsumable
    actions :all
    respond_to :html
    #TODO This should not be there. Added because of an issue.
    belongs_to :subscription, parent_class: Subscription, optional: true

    def create
      create! { non_consumables_url }
    end

    def update
      update! { non_consumables_url }
    end

    def destroy
      destroy! { non_consumables_url }
    end

  end
end
