class HomeController < ApplicationController
  def index
  end

  def register
    if current_user.has_role? :admin
      redirect_to director_index_path
    #else
    #  redirect_to registered_main_path
    end
  end


end
