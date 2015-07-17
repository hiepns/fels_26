require "rails_helper"
include SessionsHelper

describe LessonsController do
  let(:user) { FactoryGirl.create :user }
  let(:user) { FactoryGirl.create :user }
  describe "GET #index" do
    before do
      log_in user
      get user_category_lessons_path, {user_id: user.id.to_s, category_id: category.id.to_s}
      it { expect(response).to render_template :index }
    end

  end
end
