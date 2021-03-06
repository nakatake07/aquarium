class GenresController < ApplicationController


  def index
     if admin_signed_in?
        @genres = Genre.page(params[:page])
        else
        redirect_to top_path
        end
    end


  def new
     if admin_signed_in?
        @genre = Genre.new
        else
        redirect_to top_path
        end
    end


  def create

    	@genre = Genre.new(genre_params)
    	if @genre.save
           flash[:notice] = "1文字以上入力して下さい"
    	redirect_to new_genre_path
        else
        render 'new'
        end
    end


     def destroy
        genre = Genre.find(params[:id])
        genre.destroy
        redirect_to genres_path
    end


private

    def genre_params
    	params.require(:genre).permit(:name)
    end


end
