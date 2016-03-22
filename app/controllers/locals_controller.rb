class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  # Way of defining ACLs, TODO create universally accesible auth_(user_type) in application controller
  # before_action :auth_owner, only: [:new, :edit, :update, :destroy]


  def index
    @locals = current_user.user_type.locals.all
  end

  def show
    
  end

  def new 
    authorize Local
    @local = current_user.user_type.locals.new
  end

  def edit
    authorize @local
  end

  def create
    
    @local = current_user.user_type.locals.new(local_params)

      if @local.save
        redirect_to '/profile', notice: 'Local was successfully created.'
      else
        render :new 
      end
  end

  def update

      if @local.update(local_params)
        redirect_to @local, notice: 'Local was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    authorize @local
    @local.destroy
    redirect_to '/profile', notice: 'Local was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit(:name, :description)
    end
end
