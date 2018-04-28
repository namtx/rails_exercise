class DeveloperDecorator < Draper::Decorator
  delegate_all

  def display_languages
    languages.pluck(:code).join ", "
  end

  def display_programming_languages
    programming_languages.pluck(:name).join ", "
  end
end
