require "rails_helper"

RSpec.describe DeveloperLanguage, type: :model do
  it {is_expected.to belong_to :developer}
  it {is_expected.to belong_to :language}
end
