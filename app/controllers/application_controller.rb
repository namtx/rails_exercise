class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def response_json response, status = :ok
    render json: response, status: status
  end

  private

  def not_found
    response_json({error: :not_found}, :not_found)
  end
end
