class InquiresController < ApplicationController



	def index
		@inquires = Inquire.all
	end

	def show
		@inquire = Inquire.find(params[:id])
	end


    def form
		@inquire = Inquire.new
	end

	def create
		@inquire = Inquire.new(inquire_params)
		@inquire.save
		redirect_to top_path
	end

	def update
	end

	def destroy
        inquire = Inquire.find(params[:id])
        inquire.destroy
        redirect_to inquires_path
    end



	private

	def inquire_params
		params.require(:inquire).permit(:title, :mail, :name, :body, :re_title, :re_body)
	end

end
