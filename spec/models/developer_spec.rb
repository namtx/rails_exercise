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

  describe ".filter" do
    let(:developer){create :developer}
    let(:language){create :language}
    let(:programming_language){create :programming_language}
    context "when search by language which developer has" do
      before {create :developer_language, developer: developer, language: language}

      it {expect(Developer.filter([language.id], :languages)).to eq [developer]}
    end

    context "when search by language which developer doesn't have" do
      it {expect{Developer.filter([language.id + 100], :languages).to eq nil}}
    end

    context "when search by programming language which developer has" do
      before {create :developer_programming_language, developer: developer, programming_language: programming_language}

      it {expect(Developer.filter([programming_language.id], :programming_languages)).to eq [developer]}
    end

    context "when search by programming language which developer doesn't have" do
      it {expect{Developer.filter([language.id + 100], :programming_languages).to eq nil}}
    end

    context "when search both on language and programming language" do
      before do
        create :developer_programming_language, developer: developer, programming_language: programming_language
        create :developer_language, developer: developer, language: language
      end

      it do
        expect(Developer.filter([language.id], :languages)
                 .filter([programming_language.id], :programming_languages)).to eq [developer]
      end
    end
  end
end
