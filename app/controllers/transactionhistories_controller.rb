class TransactionhistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_client

  # GET /transactionhistories or /transactionhistories.json
  def index
    
    @transactionhistories = Transactionhistory.all
    @battles = @client.getPlayerByPowerstats
    @battles2 = @client.getPlayerByPowerstats
    @transactionhistory = current_user.transactionhistories.build
    @user = current_user.id
  end

  # GET /transactionhistories/1 or /transactionhistories/1.json
  def show
  end

  # GET /transactionhistories/new
  def new
    @transactionhistory = current_user.transactionhistories.build
  end

  # GET /transactionhistories/1/edit
  def edit
  end

  # POST /transactionhistories or /transactionhistories.json
  def create
    @transactionhistory = Transactionhistory.new(transactionhistory_params)  

   # respond_to do |format|
      if @transactionhistory.save
    #    format.html { redirect_to @transactionhistory, notice: "Wrapper was successfully created." }
     #   format.json { render :show, status: :created, location: @transactionhistory }
      else
      #  format.html { render :new, status: :unprocessable_entity }
       # format.json { render json: @transactionhistory.errors, status: :unprocessable_entity }
      #end
      end
  end

  # PATCH/PUT /transactionhistories/1 or /transactionhistories/1.json
  def update
    respond_to do |format|
      if @transactionhistory.update(transactionhistory_params)
        format.html { redirect_to @transactionhistory, notice: "Transactionhistory was successfully updated." }
        format.json { render :show, status: :ok, location: @transactionhistory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transactionhistory.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /transactionhistories/1 or /transactionhistories/1.json
  def destroy
    @transactionhistory.destroy
    respond_to do |format|
      format.html { redirect_to transactionhistories_url, notice: "Transactionhistory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transactionhistory
      @transactionhistory = Transactionhistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transactionhistory_params
      params.require(:transactionhistory).permit(:bet,:amountofbet,:user_id)
    end

      def initialize_client
          @client = Superhero::Client.new
      end
    
    
  

end
