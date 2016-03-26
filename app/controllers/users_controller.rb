class UsersController < ApplicationController
# error here?
	before_action :authenticate_user!

	def profile
	@user = current_user
		if @user.user_type_type == "Owner"
			redirect_to locals_path
		end
	end
end
