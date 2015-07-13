require 'rails_helper'
include SessionsHelper

describe UsersController do
  let(:user) { FactoryGirl.create :user }

  describe "GET #new" do
    context "render signup form" do
      before { get :new }
      it { expect(response).to render_template :new }
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before { post :create, user: FactoryGirl.attributes_for(:user) }
      it { expect(response).to redirect_to root_url }
      it { expect(flash[:info]).to eq "Please check your email to activate your account." }
    end

    context "with invalid attributes" do
      before { post :create, user: FactoryGirl.attributes_for(:invalid_user) }
      it { expect(response).to render_template :new }

    end
  end

  describe "Loged in User" do
    before do
      log_in user
    end

    describe "GET #index" do
      context "render user's index" do
        before { get :index }
        it { expect(response).to render_template :index }

      end

    end

    describe "GET #show" do
      context "render user's info" do
        before { get :show, id: user.id }
        it { expect(response).to render_template :show }

      end

    end

  end


end
