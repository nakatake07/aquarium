class ReviewsController < ApplicationController

	def create
		#controller/enduuser/cdのdef showから飛んでくる
	    @review = Review.new(review_params)
	    @piranha = Piranha.find(@review.piranha_id)
		@reviews = @piranha.reviews
	    @review.user_id = current_user.id
        if @review.save
        	flash[:create] = "コメントが追加されました"
            redirect_to piranha_path(@piranha)
        else
        	render "piranha/show"
        end
	end



	def destroy
#		@review = Review.find_by(cd_id: params[:id], enduser_id: current_endusers_enduser.id)
	    @review = Review.find(params[:id])
	    #if @review.enduser_id ==current_endusers_enduser.id
		@review.destroy
		#end
		redirect_to piranha_path(@review.piranha)
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			flash[:update] = "コメントが更新されました"
			redirect_to piranha_path(@review.piranha)
	    else
	    	render :edit
	    end
	end



	private

    def review_params
      params.require(:review).permit(:piranha_id, :review_title, :review_body)
    end



end
