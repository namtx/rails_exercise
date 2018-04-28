class DevelopersController < ApplicationController
  before_action :load_filters_data, only: :index

  def index
    @developers = Developer.preload :languages, :programming_languages
    %i(languages programming_languages).each do |filter|
      @developers = @developers.filter(params[filter], filter) if params[filter].present?
    end
  end

  private

  def load_filters_data
    @languages = Language.load_with_cache
    @programming_languages = ProgrammingLanguage.load_with_cache
  end
end
