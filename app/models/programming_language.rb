class ProgrammingLanguage < ApplicationRecord
  include Touchable

  has_many :developer_programming_languages
  has_many :developers, through: :developer_programming_languages

  validates :name, presence: true, uniqueness: true
end
