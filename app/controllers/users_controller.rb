class UsersController < ApplicationController

    def index
    @users = User.page(params[:page])
    end


	def show
        @user = User.find(params[:id])
      if current_user.id != @user.id
		redirect_to root_path
	  end
    end


    def edit
        @user = User.find(params[:id])
	 if current_user.id != @user.id
		redirect_to user_path(current_user)
	 end
    end


    def leave
		@user = User.find(params[:id])
	end


	def update
		@user = User.find(params[:id])
     if @user.update(user_params)
         flash[:notice] = 'successfully'
         redirect_to user_path(current_user.id)
     else
    	render 'edit'
    end
   end



    def destroy
		@user = user.find(params[:id])
        @user.destroy
        redirect_to users_path
	end



private

	def user_params
	    params.require(:user).permit(:name, :mail)
	end




end
