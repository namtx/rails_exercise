FactoryBot.define do
  sequence :email do |n|
    "sample_email+#{n}@sample.com"
  end

  factory :developer do
    email
  end
end
