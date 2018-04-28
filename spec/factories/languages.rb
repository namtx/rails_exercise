FactoryBot.define do
  sequence :code do |n|
    "lang_#{n}"
  end

  factory :language do
    code
  end
end
