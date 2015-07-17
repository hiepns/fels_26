require "rails_helper"

describe User do
  let(:user) { FactoryGirl.create :user }
  let(:not_activated_user) { FactoryGirl.create :not_activated_user }

  context "User" do
    it "be valid" do
      expect(user).to be_valid
    end
    it "be invalid" do
      user.email = nil
      expect(user).not_to be_valid
    end
    it "not been activated" do
      expect(not_activated_user.activated?).to eq false
    end
    it "have been activated" do
      not_activated_user.activate
      expect(not_activated_user.activated?).to eq true
    end
  end

  context "Name" do
    it "invalid when empty" do
      user.name = nil
      expect(user).not_to be_valid
    end

    it "not uniqueness" do
      user.name = "abc"
      other_user = FactoryGirl.build :user, name: "abc"
      expect(other_user).to be_valid
    end
  end

  context "Password" do
    it "invalid when empty" do
      user.password = nil
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end
    it "invalid when password_confimation different with password" do
      user.password = "test123"
      user.password_confirmation = "123test"
      user.save
      expect(user).not_to be_valid
    end

    it "invalid when length smaller than 6" do
      user.password = "1234"
      user.password_confirmation = "1234"
      expect(user).not_to be_valid
    end
  end

  context "Email" do
    it "invalid when empty" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "be uniqueness" do
      user.email = "abc@gmail.com"
      user.save
      other_user = FactoryGirl.build :user, email: "abc@gmail.com"
      expect(other_user).not_to be_valid
    end

    it "invalid type 1" do
      user.email = "abc.com"
      expect(user).not_to be_valid
    end

    it "invalid type 2" do
      user.email = "abc@gmailcom"
      expect(user).not_to be_valid
    end
  end

  context "User-Follow" do
    before do
      @users = []
      30.times { @users << FactoryGirl.create(:user) }
      @part1 = @users[1..20]
      @part2 = @users[10..30]

    end
    it "valid when have many follower" do
      @part1.each { |follower| follower.follow(user) }
      expect(user.followers.count).to eql 20
    end
    it "valid when follow many user" do
      @part2.each { |followed| user.follow(followed) }
      expect(user.followings.count).to eql 20
    end
  end
  describe "test associations" do
    context "has_many" do
      it { expect(user).to have_many(:active_relationships) }
      it { expect(user).to have_many(:followings) }
      it { expect(user).to have_many(:followers) }
      it { expect(user).to have_many(:lessons) }

    end
  end
end



