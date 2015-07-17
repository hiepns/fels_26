require "rails_helper"
include SessionsHelper

describe WordListController do
  let(:user) { FactoryGirl.create :user }
  describe "GET #index" do
    before do
      log_in user
      get :index
    end
    it { expect(response).to render_template :index }
  end

end
