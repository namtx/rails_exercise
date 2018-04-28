class Developer < ApplicationRecord
  has_many :developer_languages
  has_many :languages, through: :developer_languages
  has_many :developer_programming_languages
  has_many :programming_languages, through: :developer_programming_languages

  validates :email, presence: true, uniqueness: true

  scope :filter, ->(ids, table) do
    joins(table)
    .where("#{table}" => {id: ids})
    .group("#{table_name}.id")
    .having("COUNT(DISTINCT(#{table}.id)) = ?", ids.length)
  end
end
