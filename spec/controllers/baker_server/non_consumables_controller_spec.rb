require 'spec_helper'

module BakerServer

  describe NonConsumablesController do

    def valid_attributes
      Factory.attributes_for(:non_consumable)
    end

    def valid_session
      {}
    end

    describe "GET index" do
      it "assigns all non_consumables as @non_consumables" do
        non_consumable = NonConsumable.create! valid_attributes
        get :index, {}, valid_session
        assigns(:non_consumables).should eq([non_consumable])
      end
    end

    describe "GET show" do
      it "assigns the requested non_consumable as @non_consumable" do
        non_consumable = NonConsumable.create! valid_attributes
        get :show, {:id => non_consumable.to_param}, valid_session
        assigns(:non_consumable).should eq(non_consumable)
      end
    end

    describe "GET new" do
      it "assigns a new non_consumable as @non_consumable" do
        get :new, {}, valid_session
        assigns(:non_consumable).should be_a_new(NonConsumable)
      end
    end

    describe "GET edit" do
      it "assigns the requested non_consumable as @non_consumable" do
        non_consumable = NonConsumable.create! valid_attributes
        get :edit, {:id => non_consumable.to_param}, valid_session
        assigns(:non_consumable).should eq(non_consumable)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new NonConsumable" do
          expect {
            post :create, {:non_consumable => valid_attributes}, valid_session
          }.to change(NonConsumable, :count).by(1)
        end

        it "assigns a newly created non_consumable as @non_consumable" do
          post :create, {:non_consumable => valid_attributes}, valid_session
          assigns(:non_consumable).should be_a(NonConsumable)
          assigns(:non_consumable).should be_persisted
        end

        it "redirects to the created non_consumable" do
          post :create, {:non_consumable => valid_attributes}, valid_session
          response.should redirect_to(non_consumables_path)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved non_consumable as @non_consumable" do
          NonConsumable.any_instance.stub(:save).and_return(false)
          post :create, {:non_consumable => {}}, valid_session
          assigns(:non_consumable).should be_a_new(NonConsumable)
        end

        it "re-renders the 'new' template" do
          post :create, {:non_consumable => {}}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested non_consumable" do
          non_consumable = NonConsumable.create! valid_attributes
          # Assuming there are no other non_consumables in the database, this
          # specifies that the NonConsumable created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          NonConsumable.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => non_consumable.to_param, :non_consumable => {'these' => 'params'}}, valid_session
        end

        it "assigns the requested non_consumable as @non_consumable" do
          non_consumable = NonConsumable.create! valid_attributes
          put :update, {:id => non_consumable.to_param, :non_consumable => valid_attributes}, valid_session
          assigns(:non_consumable).should eq(non_consumable)
        end

        it "redirects to the non_consumable" do
          non_consumable = NonConsumable.create! valid_attributes
          put :update, {:id => non_consumable.to_param, :non_consumable => valid_attributes}, valid_session
          response.should redirect_to(non_consumables_path)
        end
      end

      describe "with invalid params" do
        it "assigns the non_consumable as @non_consumable" do
          non_consumable = NonConsumable.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          NonConsumable.any_instance.stub(:save).and_return(false)
          put :update, {:id => non_consumable.to_param, :non_consumable => {}}, valid_session
          assigns(:non_consumable).should eq(non_consumable)
        end

        it "re-renders the 'edit' template" do
          non_consumable = NonConsumable.create! valid_attributes
          put :update, {:id => non_consumable.to_param, non_consumable: {product_id: nil}}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested non_consumable" do
        non_consumable = NonConsumable.create! valid_attributes
        expect {
          delete :destroy, {:id => non_consumable.to_param}, valid_session
        }.to change(NonConsumable, :count).by(-1)
      end

      it "redirects to the non_consumables list" do
        non_consumable = NonConsumable.create! valid_attributes
        delete :destroy, {:id => non_consumable.to_param}, valid_session
        response.should redirect_to(non_consumables_url(only_path: true))
      end
    end

  end
end
