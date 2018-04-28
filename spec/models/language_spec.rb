require "rails_helper"

RSpec.describe Language, type: :model do
  context "validation" do
    it {should validate_presence_of :code}
  end

  context "associations" do
    it {is_expected.to have_many :developer_languages}
    it {is_expected.to have_many(:developers).through :developer_languages}
  end
end
