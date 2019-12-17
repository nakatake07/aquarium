class BuyersController < ApplicationController

PER = 12

 def index
    @buyers = Buyer.page(params[:page]).per(PER)
  	@buyer = Buyer.new
    @user = current_user
  end


  def show
      @buyer = Buyer.find(params[:id])
      @user = User.find(@buyer.user_id)
  end


  def edit
      @buyer = Buyer.find(params[:id])
       if @buyer.user_id != current_user.id
        redirect_to piranha_path
      end
  end


  def create

      @buyer = Buyer.new(buyer_params)
      @buyer.user_id = current_user.id
      if @buyer.save
        flash[:create] = "投稿されました"
        redirect_to buyers_path
     else
        @buyers = Buyer.page(params[:page]).per(PER)
        @user = current_user
        render :index
     end
   end


  def destroy
        @buyer = Buyer.find(params[:id])
        @buyer.destroy
        redirect_to buyers_path
  end


private

    def buyer_params
    	params.require(:buyer).permit(:title, :body, :genre_id, :image, :email)
    end

  end


