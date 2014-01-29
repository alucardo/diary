class Director::StudentsController < DirectorController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = User.students
    respond_to do |format|
      format.html
      format.json { render json: StudentsDatatable.new(view_context) }
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

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to director_users_path, notice: 'User edited' }
      else
        format.html { render action: 'edit', alert: 'Error while editing' }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to director_users_path, notice: 'User destroy'}
    end
  end

  def show

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role_ids => [])
  end
end
