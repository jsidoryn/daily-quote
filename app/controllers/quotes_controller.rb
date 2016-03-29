class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

end
