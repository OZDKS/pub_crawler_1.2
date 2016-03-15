class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  def index
    @locals = current_user.user_type.locals.all
  end

  def show
  end

  def new
    @local = current_user.user_type.locals.new
  end

  def edit
  end

  def create
    @local = current_user.user_type.locals.new(local_params)

      if @local.save
        redirect_to current_user, notice: 'Local was successfully created.'
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
    @local.destroy
    redirect_to current_user, notice: 'Local was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit(:owner_id, :name, :description)
    end
end
