FactoryBot.define do
  sequence :name do |n|
    "programming_language_#{n}"
  end

  factory :programming_language do
    name
  end
end
