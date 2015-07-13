FactoryGirl.define do
  factory :admin, class: User do
    name Faker::Internet.user_name
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
    admin true
    activated true
    activated_at Time.zone.now
  end

  factory :user, class: User do
    sequence :name do |n|
      "sampleUser#{n}"
    end
    sequence :email do |n|
      "sampleEmail#{n}@gmail.com"
    end
    password "password"
    password_confirmation "password"
    admin false
    activated true
    activated_at Time.zone.now
  end

  factory :not_activated_user, parent: :user do |b|
    b.activated nil
    b.activated_at nil
  end
  factory :invalid_user, parent: :user do |b|
    b.email nil
  end
end
