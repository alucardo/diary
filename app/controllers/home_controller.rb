class HomeController < ApplicationController
  def index
  end

  def register
    if current_user.admin?
      redirect_to admin_main_path
    else
      redirect_to registered_main_path
    end
  end


end
