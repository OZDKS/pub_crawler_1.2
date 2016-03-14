class RegistrationsController < Devise::RegistrationsController


  def create
    if params[:type] == "employee"
      user_type = Employee.new
    elsif params[:type] == "customer"
      user_type = Customer.new
    elsif params[:type] == "owner"
      user_type = Owner.new
    else
      redirect_to registration_path, notice: "Wystąpił błąd. Prosimy spróbować ponownie"
    end

    if user_type.save
      super do
        if resource.persisted?
          resource.user_type = user_type
        else
          user_type.destroy
        end
      end

    else
      # TODO some error handling
      redirect_to registration_path, notice: "Wystąpił błąd. Prosimy spróbować ponownie"
    end
  end


  protected

  def sign_up_params
    params.require(:user).permit( :first_name, :last_name, :email, :password, :password_confirmation)
  end

end