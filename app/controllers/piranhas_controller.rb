class PiranhasController < ApplicationController

  PER = 12


  def index
    @piranhas = Piranha.page(params[:page]).per(PER)
  	@piranha = Piranha.new
     @user = current_user
  end

  def show
     @piranha = Poranha.find(params[:id])
  end

  def edit
  end

   def create

      @piranha = Piranha.new(piranha_params)
      @piranha.user_id = current_user.id
      if @piranha.save
        flash[:create] = "投稿されました"
        redirect_to piranhas_path
     else
        @piranhas = Piranha.page(params[:page]).per(PER)
        @user = current_user
        render :index
     end
   end

  def destroy
        piranha = Piranha.find(params[:id])
        piranha.destroy
        redirect_to piranhas_path
  end


  private

    def piranha_params
    	params.require(:piranha).permit(:title, :body, :genre_id, :image)
    end
  end