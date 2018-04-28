module Cacheable
  extend ActiveSupport::Concern

  module ClassMethods
    def load_with_cache
      Rails.cache.fetch(cache_key) do
        all
      end
    end

    private
    def cache_key
      "#{table_name}-#{maximum :updated_at}"
    end
  end
end
