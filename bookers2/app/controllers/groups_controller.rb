class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      flash[:notice] = "You have created group successfully."
      redirect_to groups_path
    else
      render :new
    end
  end

  def index
    @user_id = current_user.id
    @user = User.find(@user_id)
    @newbook = Book.new
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "You have editted group successfully."
      redirect_to groups_path
    else
      render :edit
    end
  end

  def show
    @user_id = current_user.id
    @user = User.find(@user_id)
    @newbook = Book.new
    @group = Group.find(params[:id])
    @owner_user = User.find(@group.owner_id)
    @group_users = GroupUser.where(group_id: @group.id)
    @mails = Mail.where(group_id: @group.id)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.delete
    flash[:notice] = "You have destroyed group successfully."
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

end
