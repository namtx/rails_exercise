FactoryBot.define do
  factory :developer_programming_language do
    association :developer
    association :programming_language
  end
end
