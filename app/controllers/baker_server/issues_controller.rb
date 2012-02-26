module BakerServer
  class IssuesController < ApplicationController
    inherit_resources
    actions :all, :except => :show
    respond_to :html, :except => :download
    respond_to :atom, :only => :index
    respond_to :json, :only => :download

    def create
      create! { issues_url }
    end

    def update
      update! { issues_url }
    end

    def destroy
      destroy! { issues_url }
    end

    def download
      @issue = Issue.find params[:id]
      if @issue.paid
        #  Verify with apple
        @download_url = nil
      else
        #  Just send the content
        @download_url = "#{request.host_with_port}#{@issue.content.url}"
      end
    end

    protected
    def collection
      @issues ||= end_of_association_chain.order("published_date")
    end
  end
end
