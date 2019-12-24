class PiranhasController < ApplicationController




  def index
    @piranhas = Piranha.page(params[:page]).per(PER)
  	@piranha = Piranha.new
    @user = current_user
    @q = Piranha.ransack(params[:q])
    piranhas = @q.result(distinct: true)
  end

  def search
    @q = Piranha.search(search_params)
    @piranhas = @q.result(distinct: true)
  end


  def show
      @piranha = Piranha.find(params[:id])
      @user = User.find(@piranha.user_id)
      @review = @piranha.reviews.build
      @reviews = @piranha.reviews
  end

  def edit
      @piranha = Piranha.find(params[:id])
       if @piranha.user_id != current_user.id
        redirect_to piranha_path
      end
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

   def update
       @piranha = Piranha.find(params[:id])
      if @piranha.update(piranha_params)
      flash[:notice] = 'successfully'
      redirect_to piranha_path(@piranha)
    else
    render 'edit'
    end
   end



  def destroy
        @piranha = Piranha.find(params[:id])
        @piranha.destroy
        redirect_to piranhas_path
  end


  private

    def piranha_params
    	params.require(:piranha).permit(:title, :body, :genre_id, :image)
    end

    def search_params
    params.require(:q).permit!
  end

 end