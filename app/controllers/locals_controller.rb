class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]
  # to do authorization
  # GET /locals
  # GET /locals.json
  def index
    @locals = current_user.user_type.locals
  end

  # GET /locals/1
  # GET /locals/1.json
  def show
  end

  # GET /locals/new
  def new
    @local = Local.new
  end

  # GET /locals/1/edit
  def edit
  end

  # POST /locals
  # POST /locals.json
  def create
    @local = Local.new(local_params)
    @local.owner = current_user.user_type
      if @local.save
         redirect_to @local, notice: 'Local was successfully created.' 
      else
         render :new 
      end
    
  end

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
      
      if @local.update(local_params)
        redirect_to @local, notice: 'Local was successfully updated.' 
      else
        render :edit 
      end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_to locals_url, notice: 'Local was successfully destroyed.' }
      format.json { head :no_content }
    end
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
