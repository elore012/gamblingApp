class TopupController < ApplicationController
    def index
        byebug
        @transaction = Transactionhistory.all
    end
end