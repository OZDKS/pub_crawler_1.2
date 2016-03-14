class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:role, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def after_sign_up
  	if(User.last.role == "owner")
  		owner=Owner.create
  		owner.name="tryyyy"
  		owner.save
  		User.last.owner=owner
  		User.last.save
  	elsif(User.last.role == "employee")
  		employee=Employee.create
  		employee.save
  		User.last.employee=employee
  		User.last.save

  	elsif(User.last.role == "customer")
  		customer=Customer.create
  		customer.save
  		User.last.customer=customer
  		User.last.save
  	end
  end

end