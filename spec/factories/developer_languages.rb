FactoryBot.define do
  factory :developer_language do
    association :developer
    association :language
  end
end
