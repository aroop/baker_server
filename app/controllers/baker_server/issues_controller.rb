module BakerServer
  class IssuesController < ApplicationController
    inherit_resources
    actions :all, :except => :show
    respond_to :html, :except => :download
    respond_to :atom, :only => :index

    def create
      create! { issues_url }
    end

    def update
      update! { issues_url }
    end

    def destroy
      destroy! { issues_url }
    end

    protected
    def collection
      @issues ||= end_of_association_chain.order("published_date")
    end
  end
end
