require "rails_helper"

RSpec.describe Developer, type: :model do
  context "validation" do
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_uniqueness_of :email}
  end

  context "association" do
    it {is_expected.to have_many :developer_languages}
    it {is_expected.to have_many(:languages).through :developer_languages}
    it {is_expected.to have_many :developer_programming_languages}
    it {is_expected.to have_many(:programming_languages).through :developer_programming_languages}
  end
end
