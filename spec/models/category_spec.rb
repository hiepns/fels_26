require "rails_helper"

describe Category do
  let(:category) { FactoryGirl.create(:category) }
  context "Category" do
    it "be valid" do
      expect(category).to be_valid
    end

  end
end
