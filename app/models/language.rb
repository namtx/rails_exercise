class Language < ApplicationRecord
  include Cacheable

  has_many :developer_languages
  has_many :developers, through: :developer_languages

  validates :code, presence: true, uniqueness: true
end
