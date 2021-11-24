class FerretsController < ApplicationController
  
  before_action :set_ferret, only: [:show, :edit, :update, :destroy]
  # before_action :current_user, :set_user
  # GET /ferrets
  def index
    @ferrets = Ferret.all.includes(:user)
    @ferret = Ferret.find_by(id: params[:id])
    
  end
  # def adopted
  #   @ferrets = Ferret.all
    
  # end
  # GET /ferrets/1
  def show # show a single ferret
    
    @ferret = Ferret.find_by(id: params[:id])
    @this_ferret = @ferret.id
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: "jacobknighj@gmail.com",
      line_items: [{
        name: @ferret.name,
        # disposition: @ferret.disposition,
        images: [@ferret.picture],
        amount: 100,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          ferret_id: @ferret.id
        }
      },
      success_url: "#{root_url}payments/success?eventId=#{@ferret.id}",
      cancel_url: "#{root_url}ferrets"
    )
    @session_id = session.id
  end

  # GET /ferrets/new
  #User must exsist so finding the user from here when creating a new ferret
  def new
    
    authenticate_user!
    @ferret = Ferret.new
    # @ferret = Ferret.new
  end
  def about
  end
  # GET /ferrets/1/edit
  def edit
    @ferret = Ferret.find_by(id: params[:id])
    authenticate_user!
    authorize @ferret
  end

  # POST /ferrets
  # POST /ferrets.json
  def create
    
    authenticate_user!
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
    authorize @ferret
    authenticate_user!
    respond_to do |format|
      if @ferret.update(ferret_params)
        format.html { redirect_to @ferret, notice: 'ferret was successfully updated.' }
        format.json { render :show, status: :ok, location: @ferret }
      else
        
        format.html { render :edit }
        format.json { render json: @ferret.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ferrets/1
  # DELETE /ferrets/1.json
  def destroy
    authorize @ferret
    authenticate_user!
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
      params.require(:ferret).permit(:name, :age, :disposition, :picture, :user_id, :adopted)
    end

    
end

 
