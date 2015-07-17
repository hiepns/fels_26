require "rails_helper"

describe Answer do
  let(:answer){FactoryGirl.create(:answer)}
  context "Answer" do
    it "be valid" do
      expect(answer).to be_valid
    end
  end
end
