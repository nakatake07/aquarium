class BuyerinquiresController < ApplicationController


  def new
   @inquire = Inquire.new
  end

  def create
  	@inquire = Inquire.new(inquire_params)
  	buyer = Buyer.find(params[:buyer_id])
  	# inquire = User.find(Buyer.find(params[:buyer_id]).user_id)
	# inquire.create(inquire_params)
  	InquireMailer.send_when_user_reply(buyer,@inquire).deliver
    redirect_to top_path
	end








private

	def inquire_params
		params.require(:inquire).permit(:mail, :name, :body)
	end



end
