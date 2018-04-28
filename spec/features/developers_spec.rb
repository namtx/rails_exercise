require "rails_helper"

RSpec.feature "Developers", type: :feature do
  let!(:developers){create_list :developer, 10}
  let!(:language){create :language}
  let(:developer){create :developer}
  let!(:programming_language){create :programming_language}
  let(:developer_language){create :developer_language, developer: developer, language: language}
  let(:developer_programming_language) do
    create :developer_programming_language, developer: developer, programming_language: programming_language
  end
  before {visit developers_path}

  scenario "init page without search params" do
    expect(page).to have_button "search"
    expect(page).to have_selector :css, "select#languages"
    expect(page).to have_selector :css, "select#programming_languages"
    expect(page).to have_selector :css, "tr", count: 11
    expect(page).to have_selector :xpath, "//option[contains(., '#{language.code}')]"
  end

  scenario "when search by language" do
    developer_language
    find("#languages option[value='#{language.id}']").select_option
    click_button "search"
    expect(page).to have_selector(:css, "tr", count: 2)
    expect(page).to have_content developer.email
  end

  scenario "when search by programming language" do
    developer_programming_language
    find("#programming_languages option[value='#{programming_language.id}']").select_option
    click_button "search"
    expect(page).to have_selector(:css, "tr", count: 2)
    expect(page).to have_content developer.email
  end

  scenario "when search both programing language and language" do
    developer_language
    developer_programming_language
    find("#programming_languages option[value='#{programming_language.id}']").select_option
    find("#languages option[value='#{language.id}']").select_option
    click_button "search"
    expect(page).to have_selector(:css, "tr", count: 2)
    expect(page).to have_content developer.email
  end
end
