class Director::UsersController < DirectorController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
    respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context) }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to director_users_path, notice: 'User created' }
      else
        format.html { render action: 'new', alert: 'Error while creating' }
      end
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role_ids => [])
  end
end
