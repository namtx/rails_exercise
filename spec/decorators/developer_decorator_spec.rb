require "rails_helper"

RSpec.describe DeveloperDecorator do
  let(:language_codes){%w(en ja vn)}
  let(:developer){create :developer}
  let(:programming_language_names){%w(javascript ruby java)}

  describe "#display_languages" do
    context "when developer have no language" do
      it {expect(developer.decorate.display_languages).to eq ""}
    end

    context "when developer have multiple languages" do
      before do
        languages = language_codes.map{|c| create(:language, code: c)}
        developer.languages << languages
      end

      it {expect(developer.decorate.display_languages).to eq "#{language_codes.join(", ")}"}
    end

  end

  describe "#display_programming_language" do
    context "when user have no programming language" do
      it {expect(developer.decorate.display_programming_languages).to eq ""}
    end

    context "when user have multiple programming languages" do
      before do
        programming_languages = programming_language_names.map{|n| create(:programming_language, name: n)}
        developer.programming_languages << programming_languages
      end

      it {expect(developer.decorate.display_programming_languages).to eq "#{programming_language_names.join(", ")}"}
    end
  end
end
