class Owner < ActiveRecord::Base
	has_one :user,  :as => :user_type
	has_many :locals
end
