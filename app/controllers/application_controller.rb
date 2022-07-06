class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  private

  def layout_by_resource
    "authentication" if devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[name username]
  end
end
