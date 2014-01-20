class Director::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to director_groups_path, notice: 'Group created' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit

  end

  #def update
  #  respond_to do |format|
  #    if @page.update(page_params)
  #      format.html { redirect_to admin_pages_path, notice: t('notification.page.update') }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @page.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /pages/1
  ## DELETE /pages/1.json
  #def destroy
  #  @page.destroy
  #  respond_to do |format|
  #    format.html { redirect_to admin_pages_path, notice: t('notification.page.destroy')}
  #    format.json { head :no_content }
  #  end
  #end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def page_params
    params.require(:groups).permit(:name)
  end

end
