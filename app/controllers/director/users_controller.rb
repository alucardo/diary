class Director::UsersController < DirectorController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
    respond_to do |format|
      format.html
      #format.json { render json: UserDatatable.new(view_context) }
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
