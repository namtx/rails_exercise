class DeveloperLanguage < ApplicationRecord
  belongs_to :developer, touch: true
  belongs_to :language
end
