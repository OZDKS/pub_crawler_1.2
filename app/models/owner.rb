class Owner < ActiveRecord::Base
	has_one :user,  :as => :user_type
	has_many :locals

	# def build_from_array(params)
	# 	if params
	# 		name = params[:name]
	# 		surname = params[:surname]
	# 	end
	# end
end
