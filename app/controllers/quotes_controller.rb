class QuotesController < ApplicationController

  before_action :authenticate_user, except: [:random]

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quotes_path
    else
      render :new
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      redirect_to quotes_path
    else
      render :edit
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to quotes_path
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def random
    @quote = Quote.order("RANDOM()").first
  end


  private

    def quote_params
      params.require(:quote).permit(:quote, :source, :published_on, :notes, :active)
    end

    def authenticate_user
      unless session[:user_id]
        redirect_to root_path
      end
    end
end
