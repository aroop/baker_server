require 'spec_helper'

shared_examples_for "a product" do |resource_class|

  let!(:subscription) { Factory(:subscription) }
  pluralized_resource_class_name  = resource_class.to_s.demodulize.underscore.pluralize
  singularize_resource_class_name = resource_class.to_s.demodulize.underscore

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all #{pluralized_resource_class_name} as @#{pluralized_resource_class_name}" do
      a_product = Factory(singularize_resource_class_name.to_sym)
      get :index, {}, valid_session
      assigns(pluralized_resource_class_name.to_sym).should eq([a_product])
    end
  end

  describe "GET show" do
    it "assigns the requested #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
      a_product = Factory(singularize_resource_class_name.to_sym)
      get :show, {:id => a_product.to_param}, valid_session
      assigns(singularize_resource_class_name.to_sym).should eq(a_product)
    end
  end

  describe "GET new" do
    it "assigns a new #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
      get :new, {}, valid_session
      assigns(singularize_resource_class_name.to_sym).should be_a_new(resource_class)
    end
  end

  describe "GET edit" do
    it "assigns the requested #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
      a_product = Factory(singularize_resource_class_name.to_sym)
      get :edit, {:id => a_product.to_param}, valid_session
      assigns(singularize_resource_class_name.to_sym).should eq(a_product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AutoRenewalSubscription" do
        expect {
          post :create, {singularize_resource_class_name.to_sym => valid_attributes, :subscription_id => subscription}, valid_session
        }.to change(resource_class, :count).by(1)
      end

      it "assigns a newly created #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
        post :create, {singularize_resource_class_name.to_sym => valid_attributes, :subscription_id => subscription}, valid_session
        assigns(singularize_resource_class_name.to_sym).should be_a(resource_class)
        assigns(singularize_resource_class_name.to_sym).should be_persisted
      end

      it "redirects to the created #{singularize_resource_class_name}" do
        post :create, {singularize_resource_class_name.to_sym => valid_attributes, :subscription_id => subscription}, valid_session
        response.should redirect_to(subscription_products_path(subscription))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
        resource_class.any_instance.stub(:save).and_return(false)
        post :create, {singularize_resource_class_name.to_sym => {}, :subscription_id => subscription}, valid_session
        assigns(singularize_resource_class_name.to_sym).should be_a_new(resource_class)
      end

      it "re-renders the 'new' template" do
        post :create, {singularize_resource_class_name.to_sym => {}, :subscription_id => subscription}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested #{singularize_resource_class_name}" do
        a_product = Factory(singularize_resource_class_name.to_sym)
        put :update, {:id => a_product.to_param, singularize_resource_class_name.to_sym => {'product_id' => 'valid_id'}, :subscription_id => a_product.subscription}, valid_session
      end

      it "assigns the requested #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
        a_product = Factory(singularize_resource_class_name.to_sym)
        put :update, {:id => a_product.to_param, singularize_resource_class_name.to_sym => valid_attributes, :subscription_id => a_product.subscription}, valid_session
        assigns(singularize_resource_class_name.to_sym).should eq(a_product)
      end

      it "redirects to the #{singularize_resource_class_name}" do
        a_product = Factory(singularize_resource_class_name.to_sym)
        put :update, {:id => a_product.to_param, singularize_resource_class_name.to_sym => valid_attributes, :subscription_id => a_product.subscription}, valid_session
        response.should redirect_to(subscription_products_path(a_product.subscription))
      end
    end

    describe "with invalid params" do
      it "assigns the #{singularize_resource_class_name} as @#{singularize_resource_class_name}" do
        a_product = Factory(singularize_resource_class_name.to_sym)
        put :update, {:id => a_product.to_param, singularize_resource_class_name.to_sym => {'product_id' => nil}, :subscription_id => a_product.subscription}, valid_session
        assigns(singularize_resource_class_name.to_sym).should eq(a_product)
      end

      it "re-renders the 'edit' template" do
        a_product = Factory(singularize_resource_class_name.to_sym)
        put :update, {:id => a_product.to_param, singularize_resource_class_name.to_sym => {'product_id' => nil}, :subscription_id => a_product.subscription}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested #{singularize_resource_class_name}" do
      a_product = Factory(singularize_resource_class_name.to_sym)
      expect {
        delete :destroy, {:id => a_product.to_param, :subscription_id => a_product.subscription}, valid_session
      }.to change(resource_class, :count).by(-1)
    end

    it "redirects to the #{pluralized_resource_class_name} list" do
      a_product = Factory(singularize_resource_class_name.to_sym)
      delete :destroy, {:id => a_product.to_param, :subscription_id => a_product.subscription}, valid_session
      response.should redirect_to(subscription_products_path(a_product.subscription))
    end
  end

end

module BakerServer

  describe AutoRenewalSubscriptionsController do
    it_behaves_like "a product", AutoRenewalSubscription do
      def valid_attributes
        subscription_duration = Factory(:subscription_duration)
        Factory.attributes_for(:auto_renewal_subscription, subscription_duration_id: subscription_duration)
      end
    end
  end

  describe FreeSubscriptionsController do
    it_behaves_like "a product", FreeSubscription do
      def valid_attributes
        Factory.attributes_for(:free_subscription)
      end
    end
  end

  describe NonRenewingSubscriptionsController  do
    it_behaves_like "a product", NonRenewingSubscription do
      def valid_attributes
        Factory.attributes_for(:non_renewing_subscription)
      end
    end
  end

end
