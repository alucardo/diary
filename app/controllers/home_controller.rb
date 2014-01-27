class HomeController < ApplicationController
  def index
  end

  def register
    if current_user.has_role? :director
      redirect_to director_index_path
    else
      redirect_to root_path
    end
  end


end
