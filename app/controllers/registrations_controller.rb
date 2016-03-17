class RegistrationsController < Devise::RegistrationsController

  def new
    if !["employee","customer","owner"].include?(params[:type])
      flash[:notice]="Wystąpił błąd. Prosimy spróbować ponownie"
      redirect_to :controller=>'welocme', :action=>'register_choice'
      return
    end
    super
  end


  def create


    if params[:type] == 'employee'
      user_type = Employee.new sign_up_params[:user_type_attributes]
    elsif params[:type] == "customer"
      user_type = Customer.new sign_up_params[:user_type_attributes]
    elsif params[:type] == "owner"
      user_type = Owner.new sign_up_params[:user_type_attributes]
      else
      flash[:notice]="Wystąpił błąd. Prosimy spróbować ponownie"
      redirect_to :controller=>'welocme', :action=>'register_choice'
      return
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
      flash[:notice]="Wystąpił błąd. Prosimy spróbować ponownie"
      redirect_to :controller=>'welocme', :action=>'register_choice'
      return
    end
  end


  protected

  def sign_up_params
    if params[:type] == 'employee'
      attribs =[:name,:surname]
    elsif params[:type] == 'customer'
      attribs = [:username]
    elsif params[:type] == 'owner'
      attribs = [:name, :surname]
    else
      return
    end
    params.require(:user).permit( :email, :password, :password_confirmation, :user_type_attributes =>attribs )

  end

end