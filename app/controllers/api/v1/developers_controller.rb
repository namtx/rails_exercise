module Api::V1
  class DevelopersController < ApplicationController
    before_action :load_developer, only: :show

    def show
      json = Rails.cache.fetch(@developer.cache_key) do
        @developer.to_json include: [:languages, :programming_languages]
      end
      response_json json
    end

    private

    def load_developer
      @developer = Developer.find params[:id]
    end
  end
end
