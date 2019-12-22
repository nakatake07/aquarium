class BuyerinquiresController < ApplicationController
  def new
  	@buyer = Buyer.find(params[:id])
  	@buyer.email
  end








end
