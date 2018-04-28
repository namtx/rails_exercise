module Touchable
  extend ActiveSupport::Concern

  included do
    after_commit :touch_developers
  end

  def touch_developers
    developers.touch
  end
end
