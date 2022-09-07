class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid


private

def render_not_found(err)
  render json: {error: "#{err.model} not found"}, status: 404
end

def render_invalid(err)
  render json: {errors: err.record.errors.full_messages}, status: 422
end

end
