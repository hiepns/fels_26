require "rails_helper"

describe Word do
  let(:word){FactoryGirl.create(:word)}
  context "Word" do
    it "be valid" do
      expect(word).to be_valid
    end
    it "belog to category" do
      expect(word.category).to be_valid
    end
  end
end
