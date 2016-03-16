class Owner < ActiveRecord::Base
	has_one :user,  :as => :user_type
	has_many :locals

	def build_from_array(params)
		
	end
end
