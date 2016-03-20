class ApplicationPolicy
  attr_reader :user, :record

  def owner?
    @user && @user.user_type_type == "Owner"
  end

  def employee?
    @user && @user.user_type_type == "Employee"
  end

  def customer?
    @user && @user.user_type_type == "Customer"
  end

  def loggged?
    @user
  end


  def initialize(user, record)
    @user = user
    @record = record
  end


  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
