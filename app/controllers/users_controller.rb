class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash.now[:success] = "account created"
			log_in(@user)
			redirect_to posts_url
		else
			flash.now[:warning] = "creation unsuccessful"
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation) 
	end

end
