class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all.includes(:user)
    # eager loading for category doesnt work, its asking for category.item_id for some reason
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find_by(id: params[:id])
    @this_item = @item.id
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: "jacobknighj@gmail.com",
      line_items: [{
        name: @item.title,
        # disposition: @item.disposition,
        amount: 50,
        currency: "aud",
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          item_id: @item.id
        }
      },
      success_url: "#{root_url}payments/success?eventId=#{@item.id}",
      cancel_url: "#{root_url}items"
    )
    @session_id = session.id
  end
  

  # GET /items/new
  def new
    @item = Item.new
    @category = Category.all
  end

  # GET /items/1/edit
  def edit
    authenticate_user!
    authorize @item
    @category = Category.all
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    authenticate_user!
    authorize @item
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    authenticate_user!
    authorize @item
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :content, :price, :references, :user_id, :category_id)
    end
end
