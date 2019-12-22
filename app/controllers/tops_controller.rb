class TopsController < ApplicationController

	def top
		@inquire = Inquire.new
	end

	def create
		@inquire = Inquire.new(inquire_params)
		@inquire.save
		redirect_to root_path
	end

	private

	def inquire_params
		params.require(:inquire).permit(:title, :mail, :name, :body)
	end



end
