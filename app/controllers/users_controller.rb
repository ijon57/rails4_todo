class UsersController < ApplicationController



  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name)
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def update
    user_params = params.require(:user).permit(:name)
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
  end
end
