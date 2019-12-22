class FavoritesController < ApplicationController

  def index
    @favorites = Favorit.all
  end

	def create
    @favorit = Favorit.create(user_id:current_user.id,  piranha_id: params[:piranha_id])
    #@favorit.save
    redirect_back(fallback_location: top_path)
  end

  def destroy
    @favorit = Favorit.find_by(piranha_id: params[:piranha_id], user_id: current_user.id)
    @favorit.destroy
    redirect_back(fallback_location: top_path)
  end
end
