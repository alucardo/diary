class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :instantiate_controller_and_action_names



  private

  def instantiate_controller_and_action_names

    @current_action = action_name

    @current_controller = controller_name

  end


end
