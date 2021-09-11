class TransactionhistoriesController < ApplicationController
  before_action :set_transactionhistory, only: %i[ show 
   update destroy ]
  before_action :authenticate_user!
  before_action :initialize_client

  def topup
    @userpoints = current_user.current_points
  end

  def index
    
    if Transactionhistory.last.blank?
      Transactionhistory.create(bet:"admin",amountofbet:1000,user_id:current_user.id,result:"admin",
                                ifwin:"admin",currentpoints:0,pointsaftermatch:0)
    end
    @lasttransaction = Transactionhistory.last
    @user = current_user.current_points 
    @pointsaftermatch = @lasttransaction.pointsaftermatch

    if @user <= 0 
      redirect_to edit_user_registration_path
    end


    @transactionhistories = Transactionhistory.all
    @battles = @client.getPlayerByPowerstats
    @battles2 = @client.getPlayerByPowerstats
    @transactionhistory = current_user.transactionhistories.build
   
  end

  # GET /transactionhistories/1 or /transactionhistories/1.json
  def show
  end

  # GET /transactionhistories/new
  def new
    @transactionhistory = current_user.transactionhistories.build
  end

  
  def edit
    
    number = 5
    randomnumber = rand(10)
    @transactionhistory = Transactionhistory.last

        if randomnumber >= number
            @transactionhistory.update(result: "player one")
            @playeronewin = @transactionhistory.result
        elsif randomnumber < number
            @transactionhistory.update(result: "player two")
            @playertwowin = @transactionhistory.result
  
        end

        if @transactionhistory.bet == @transactionhistory.result
            @transactionhistory.update(ifwin: "WIN")

        elsif @transactionhistory.bet != @transactionhistory.result
              @transactionhistory.update(ifwin: "LOSE")
        end

        if @transactionhistory.ifwin == "WIN"
          current_user.update(current_points: current_user.current_points + @transactionhistory.amountofbet)
        @transactionhistory.update(pointsaftermatch:current_user.current_points)
        else
          current_user.update(current_points: current_user.current_points - @transactionhistory.amountofbet)
          @transactionhistory.update(pointsaftermatch:current_user.current_points)
        end
  
  end

  # POST /transactionhistories or /transactionhistories.json
  def create
    
  index
    @transactionhistory = Transactionhistory.new(transactionhistory_params)  
    @bet = @transactionhistory.amountofbet
    @lasttransaction=Transactionhistory.last
    

        if @bet > @user
            respond_to do |format|
              format.js { render :js => "error();" }
            end
        end

      
        if@transactionhistory.save
            @user = @user - @bet
            @transactionhistory.update(pointsaftermatch:@lasttransaction.pointsaftermatch)
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
      params.require(:transactionhistory).permit(:bet,:amountofbet,:user_id,:currentpoints)
    end

      def initialize_client
          @client = Superhero::Client.new
      end
    
    
  

end
