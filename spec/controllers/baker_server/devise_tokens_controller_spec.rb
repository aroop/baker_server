require 'spec_helper'

module BakerServer
  describe DeviseTokensController do

    def valid_attributes
      Factory.attributes_for(:devise_token)
    end

    def valid_session
      {}
    end

    describe "GET index" do
      it "assigns all devise_tokens as @devise_tokens" do
        devise_token = DeviseToken.create! valid_attributes
        get :index, {}, valid_session
        assigns(:devise_tokens).should eq([devise_token])
      end
    end

    describe "GET show" do
      it "assigns the requested devise_token as @devise_token" do
        devise_token = DeviseToken.create! valid_attributes
        get :show, {:id => devise_token.to_param}, valid_session
        assigns(:devise_token).should eq(devise_token)
      end
    end

    describe "GET new" do
      it "assigns a new devise_token as @devise_token" do
        get :new, {}, valid_session
        assigns(:devise_token).should be_a_new(DeviseToken)
      end
    end

    describe "GET edit" do
      it "assigns the requested devise_token as @devise_token" do
        devise_token = DeviseToken.create! valid_attributes
        get :edit, {:id => devise_token.to_param}, valid_session
        assigns(:devise_token).should eq(devise_token)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new DeviseToken" do
          expect {
            post :create, {:devise_token => valid_attributes}, valid_session
          }.to change(DeviseToken, :count).by(1)
        end

        it "assigns a newly created devise_token as @devise_token" do
          post :create, {:devise_token => valid_attributes}, valid_session
          assigns(:devise_token).should be_a(DeviseToken)
          assigns(:devise_token).should be_persisted
        end

        it "redirects to the created devise_token" do
          post :create, {:devise_token => valid_attributes}, valid_session
          response.should redirect_to(devise_tokens_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved devise_token as @devise_token" do
          # Trigger the behavior that occurs when invalid params are submitted
          DeviseToken.any_instance.stub(:save).and_return(false)
          post :create, {:devise_token => {}}, valid_session
          assigns(:devise_token).should be_a_new(DeviseToken)
        end

        it "re-renders the 'new' template" do
          post :create, {:devise_token => {}}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested devise_token" do
          devise_token = DeviseToken.create! valid_attributes
          # Assuming there are no other devise_tokens in the database, this
          # specifies that the DeviseToken created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          DeviseToken.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => devise_token.to_param, :devise_token => {'these' => 'params'}}, valid_session
        end

        it "assigns the requested devise_token as @devise_token" do
          devise_token = DeviseToken.create! valid_attributes
          put :update, {:id => devise_token.to_param, :devise_token => valid_attributes}, valid_session
          assigns(:devise_token).should eq(devise_token)
        end

        it "redirects to the devise_tokens" do
          devise_token = DeviseToken.create! valid_attributes
          put :update, {:id => devise_token.to_param, :devise_token => valid_attributes}, valid_session
          response.should redirect_to(devise_tokens_path)
        end
      end

      describe "with invalid params" do
        it "assigns the devise_token as @devise_token" do
          devise_token = DeviseToken.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          DeviseToken.any_instance.stub(:save).and_return(false)
          put :update, {:id => devise_token.to_param, :devise_token => {}}, valid_session
          assigns(:devise_token).should eq(devise_token)
        end

        it "re-renders the 'edit' template" do
          devise_token = DeviseToken.create! valid_attributes
          put :update, {:id => devise_token.to_param, devise_token: {token: nil}}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested devise_token" do
        devise_token = DeviseToken.create! valid_attributes
        expect {
          delete :destroy, {:id => devise_token.to_param}, valid_session
        }.to change(DeviseToken, :count).by(-1)
      end

      it "redirects to the devise_tokens list" do
        devise_token = DeviseToken.create! valid_attributes
        delete :destroy, {:id => devise_token.to_param}, valid_session
        response.should redirect_to(devise_tokens_url(only_path: true))
      end
    end

  end
end
