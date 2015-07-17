FactoryGirl.define do
  factory :answer do
    answer Faker::Lorem.word
    created_at Time.zone.now
    correct false
    word { create(:word) }

  end

end
