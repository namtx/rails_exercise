require "rails_helper"

RSpec.describe DeveloperProgrammingLanguage, type: :model do
  it {is_expected.to belong_to :developer}
  it {is_expected.to belong_to :programming_language}
end
