class PiranhasController < ApplicationController
  def index
  	@piranha = Piranha.new
  end

  def show
  end

  def edit
  end




  private

    def genre_params
    	params.require(:Piranha).permit(:title, :body, :genre_id, :image)
    end


end

