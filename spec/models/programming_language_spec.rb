require "rails_helper"

RSpec.describe ProgrammingLanguage, type: :model do
  context "validation" do
    it {should validate_presence_of :name}
  end

  context "associations" do
    it {is_expected.to have_many :developer_programming_languages}
    it {is_expected.to have_many(:developers).through :developer_programming_languages}
  end
end
