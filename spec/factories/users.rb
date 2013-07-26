FactoryGirl.define do
  factory :user do |f|
    f.fullname { Faker::Name.name }
    f.username { Faker::Name.name }
    f.password_digest { Faker::Name.name}
  end
end