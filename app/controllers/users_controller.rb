class UsersController < ApplicationController
before_filter :authenticate_user!

  def show
  	@user = User.find(params[:id]).user_type
  end

  def profile
  	@user = current_user
  end
end
