FactoryGirl.define do
  factory :category do
    name Faker::Lorem.word
    icon nil
    total 100
    created_at Time.zone.now
  end

end
