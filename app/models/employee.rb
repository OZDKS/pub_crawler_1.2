class Employee < ActiveRecord::Base
	has_one :user, :as => :user_type
	belongs_to :local
end
