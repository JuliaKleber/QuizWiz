class UsersController < ApplicationController
  def login
  end

  def create
    @user = User.new(user_params)
    if @user.photo.attached.
      user.save
    redirect_to user_path(@user)
    else
    render :new, status: :unprocessable_entity
    end
    end
    def user_params
    params.require(:user).permit(:email, :password, :photo)
  end
end
