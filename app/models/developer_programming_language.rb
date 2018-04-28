class DeveloperProgrammingLanguage < ApplicationRecord
  belongs_to :developer, touch: true
  belongs_to :programming_language
end
