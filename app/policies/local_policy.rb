class LocalPolicy < ApplicationPolicy

	def belongs_to?
		@user.user_type_type == "Owner" and @user.user_type_id == @record.owner_id
	end

	def is_owner?
		@user.user_type_type == "Owner"
	end

	# def initialize(user, local)
 #    	@user = user
 #    	@local = local
 #  	end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    is_owner?
  end

  def update?
  	belongs_to? 
  end

  def destroy?
  	belongs_to?
  end


end