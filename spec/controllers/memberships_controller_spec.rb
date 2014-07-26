require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MembershipsController do

  let(:user) { User.create!(email: 'user@example.org', name: 'My little pony') }
  # This should return the minimal set of attributes required to create a valid
  # Membership. As you add validations to Membership, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user_id" => user.id } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MembershipsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all memberships as @memberships" do
      membership = Membership.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:memberships)).to eq([membership])
    end
  end

  describe "GET show" do
    it "assigns the requested membership as @membership" do
      membership = Membership.create! valid_attributes
      get :show, {:id => membership.to_param}, valid_session
      expect(assigns(:membership)).to eq(membership)
    end
  end

  describe "GET new" do
    it "assigns a new membership as @membership" do
      get :new, {}, valid_session
      expect(assigns(:membership)).to be_a_new(Membership)
    end
  end

  describe "GET edit" do
    it "assigns the requested membership as @membership" do
      membership = Membership.create! valid_attributes
      get :edit, {:id => membership.to_param}, valid_session
      expect(assigns(:membership)).to eq(membership)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Membership" do
        expect {
          post :create, {:membership => valid_attributes}, valid_session
        }.to change(Membership, :count).by(1)
      end

      it "assigns a newly created membership as @membership" do
        post :create, {:membership => valid_attributes}, valid_session
        expect(assigns(:membership)).to be_a(Membership)
        expect(assigns(:membership)).to be_persisted
      end

      it "redirects to the created membership" do
        post :create, {:membership => valid_attributes}, valid_session
        expect(response).to redirect_to(Membership.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved membership as @membership" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Membership).to receive(:save).and_return(false)
        post :create, {:membership => { "user" => "invalid value" }}, valid_session
        expect(assigns(:membership)).to be_a_new(Membership)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Membership).to receive(:save).and_return(false)
        post :create, {:membership => { "user" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested membership" do
        membership = Membership.create! valid_attributes
        # Assuming there are no other memberships in the database, this
        # specifies that the Membership created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Membership).to receive(:update).with({ "user_id" => user.id.to_s })
        put :update, {:id => membership.to_param, :membership => { "user_id" => user.id }}, valid_session
      end

      it "assigns the requested membership as @membership" do
        membership = Membership.create! valid_attributes
        put :update, {:id => membership.to_param, :membership => valid_attributes}, valid_session
        expect(assigns(:membership)).to eq(membership)
      end

      it "redirects to the membership" do
        membership = Membership.create! valid_attributes
        put :update, {:id => membership.to_param, :membership => valid_attributes}, valid_session
        expect(response).to redirect_to(membership)
      end
    end

    describe "with invalid params" do
      it "assigns the membership as @membership" do
        membership = Membership.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Membership).to receive(:save).and_return(false)
        put :update, {:id => membership.to_param, :membership => { "user" => "invalid value" }}, valid_session
        expect(assigns(:membership)).to eq(membership)
      end

      it "re-renders the 'edit' template" do
        membership = Membership.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Membership).to receive(:save).and_return(false)
        put :update, {:id => membership.to_param, :membership => { "user" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested membership" do
      membership = Membership.create! valid_attributes
      expect {
        delete :destroy, {:id => membership.to_param}, valid_session
      }.to change(Membership, :count).by(-1)
    end

    it "redirects to the memberships list" do
      membership = Membership.create! valid_attributes
      delete :destroy, {:id => membership.to_param}, valid_session
      expect(response).to redirect_to(memberships_url)
    end
  end

end
