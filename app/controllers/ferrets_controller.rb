class FerretsController < ApplicationController
  before_action :authenticate_user!, except: %i[:index :show]
  before_action :set_ferret, only: [:show, :edit, :update, :destroy]
  # current_user :set_user

  # GET /ferrets
  # GET /ferrets.json
  def index
    @ferrets = Ferret.all
  end

  # GET /ferrets/1
  # GET /ferrets/1.json
  def show # show a single ferret
    @ferret = Ferret.find_by(id: params[:id])
  end

  # GET /ferrets/new
  #User must exsist so finding the user from here when creating a new ferret
  def new
    @ferret = Ferret.new
    @user
    
      
  end

  # GET /ferrets/1/edit
  def edit
  end

  # POST /ferrets
  # POST /ferrets.json
  def create
    @ferret = Ferret.new(ferret_params)

    respond_to do |format|
      if @ferret.save
        format.html { redirect_to @ferret, notice: 'ferret was successfully created.' }
        format.json { render :show, status: :created, location: @ferret }
      else
        # set_genres
        format.html { render :new }
        format.json { render json: @ferret.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ferrets/1
  # PATCH/PUT /ferrets/1.json
  def update
    respond_to do |format|
      if @ferret.update(ferret_params)
        format.html { redirect_to @ferret, notice: 'ferret was successfully updated.' }
        format.json { render :show, status: :ok, location: @ferret }
      else
        # set_genres
        format.html { render :edit }
        format.json { render json: @ferret.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ferrets/1
  # DELETE /ferrets/1.json
  def destroy
    @ferret.destroy
    respond_to do |format|
      format.html { redirect_to ferrets_url, notice: 'ferret was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferret
      @ferret = Ferret.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ferret_params
      params.require(:ferret).permit(:name, :age, :disposition, :picture)
    end

    # def set_genres
    #   @genres = Genre.all
    # end 
end

 
