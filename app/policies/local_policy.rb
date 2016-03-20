class LocalPolicy < ApplicationPolicy


	def belongs_to?
		@user and @user.user_type_type == "Owner" and @user.user_type_id == @local.owner_id
	end


	# def initialize(user, local)
 #    	@user = user
 #    	@local = local
 #  	end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    owner?
  end

  def update?
  	belongs_to? 
  end

  def destroy?
  	belongs_to?
  end
end