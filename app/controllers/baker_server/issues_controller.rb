module BakerServer
  class IssuesController < ApplicationController
    inherit_resources
    actions :all
    respond_to :html, :atom

    def create
      create!{ issues_url }
    end

    def update
      update!{ issues_url }
    end

    def destroy
      destroy!{ issues_url }
    end

    protected
    def collection
      @issues ||= end_of_association_chain.order("published_date")
    end
  end
end
