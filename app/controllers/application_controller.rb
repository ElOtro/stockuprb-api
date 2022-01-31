class ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, :with => :route_not_found

  def route_not_found
    render json: { error: "Not found" }, status: :not_found
  end

end
