require 'spec_helper'

module BakerServer
  describe IssuesController do

    def valid_attributes
      Factory.attributes_for(:issue)
    end

    def valid_session
      {}
    end

    describe "GET index" do
      it "assigns all issues as @issues" do
        issue = Issue.create! valid_attributes
        get :index, {}, valid_session
        assigns(:issues).should eq([issue])
      end

      it "should respond to atom feed" do
        issue = Issue.create! valid_attributes
        get :index, {format: 'atom'}, valid_session
        response.should be_success
      end
    end

    describe "GET new" do
      it "assigns a new issue as @issue" do
        get :new, {}, valid_session
        assigns(:issue).should be_a_new(Issue)
      end
    end

    describe "GET edit" do
      it "assigns the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        get :edit, {:id => issue.to_param}, valid_session
        assigns(:issue).should eq(issue)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Issue" do
          expect {
            post :create, {:issue => valid_attributes}, valid_session
          }.to change(Issue, :count).by(1)
        end

        it "assigns a newly created issue as @issue" do
          post :create, {:issue => valid_attributes}, valid_session
          assigns(:issue).should be_a(Issue)
          assigns(:issue).should be_persisted
        end

        it "redirects to the issues list" do
          post :create, {:issue => valid_attributes}, valid_session
          response.should redirect_to(issues_url(only_path: true))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved issue as @issue" do
          # Trigger the behavior that occurs when invalid params are submitted
          Issue.any_instance.stub(:save).and_return(false)
          post :create, {:issue => {}}, valid_session
          assigns(:issue).should be_a_new(Issue)
        end

        it "re-renders the 'new' template" do
          post :create, {:issue => {}}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested issue" do
          issue = Issue.create! valid_attributes
          Issue.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => issue.to_param, :issue => {'these' => 'params'}}, valid_session
        end

        it "assigns the requested issue as @issue" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, :issue => valid_attributes}, valid_session
          assigns(:issue).should eq(issue)
        end

        it "redirects to issues list" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, :issue => valid_attributes}, valid_session
          response.should redirect_to(issues_url(only_path: true))
        end
      end

      describe "with invalid params" do
        it "assigns the issue as @issue" do
          issue = Issue.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Issue.any_instance.stub(:save).and_return(false)
          put :update, {:id => issue.to_param, :issue => {}}, valid_session
          assigns(:issue).should eq(issue)
        end

        it "re-renders the 'edit' template" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, issue: {issue_id: nil}}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested issue" do
        issue = Issue.create! valid_attributes
        expect {
          delete :destroy, {:id => issue.to_param}, valid_session
        }.to change(Issue, :count).by(-1)
      end

      it "redirects to the issues list" do
        issue = Issue.create! valid_attributes
        delete :destroy, {:id => issue.to_param}, valid_session
        response.should redirect_to(issues_url(only_path: true))
      end
    end

  end

end
