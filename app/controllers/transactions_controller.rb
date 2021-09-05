class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :initialize_client
    def index
        byebug
        @battles = @client.getPlayerByPowerstats
        @battles2 = @client.getPlayerByPowerstats
        @bobo = Transaction.new
    end

     
    def initialize_client
        @client = Superhero::Client.new
    end

  
end