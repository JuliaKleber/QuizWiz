class UsersController < ApplicationController
  def login
  end

  # def create
  #   @user = user.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
  # def user_params
  #   params.require(:user).permit(:email, :encrypted_password, :user_name, :photo)
  # end
end
