FactoryGirl.define do
  factory :member do
    name    { Faker::Name.name}
    email   { Faker::Internet.email}
    dob     { Faker::Date.between(10.years.ago, Date.today)}
  end
end
