FactoryGirl.define do
  factory :word do
    word Faker::Lorem.word
    created_at Time.zone.now
    category { create(:category) }
  end

end
