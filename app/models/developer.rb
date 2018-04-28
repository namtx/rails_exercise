class Developer < ApplicationRecord
  has_many :developer_languages
  has_many :languages, through: :developer_languages
  has_many :developer_programming_languages
  has_many :programming_languages, through: :developer_programming_languages

  validates :email, presence: true, uniqueness: true

  def self.touch
    update_all updated_at: Time.zone.now
  end
end
