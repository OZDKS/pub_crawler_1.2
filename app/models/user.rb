class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    # virtual attributes to get form fields for user_type
    attr_accessor	:user_type_attributes

	#ASSOCIATIONS
	belongs_to :user_type, polymorphic: true

	accepts_nested_attributes_for :user_type
end
