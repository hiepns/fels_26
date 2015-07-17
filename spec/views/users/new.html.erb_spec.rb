require "rails_helper"

describe "users/new.html.erb" do
  subject { rendered }
  let(:user) { mock_model(User) }
  before do
    assign :user, user
    render
  end

  it "request UsersController#new" do
    expect(controller.request.path_parameters[:controller]).to eq "users"
    expect(controller.request.path_parameters[:action]).to eq "new"
  end

  it "display signup form correctly" do
    is_expected.to have_selector "form" do |form|
      form.is_expected.to have_selector "input", type: "submit"
    end

  end
end
