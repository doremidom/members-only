class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id 
		if @post.save
			flash[:success] = "Your post has been added, bitch."
			redirect_to posts_url
		else
			messages = @post.errors.full_messages.join(' ')
			flash.now[:warning] = "An error occurred. " + messages
			render :new
		end
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  	end

  	private 

  	def post_params
  		params.require(:post).permit(:subject, :body)
  	end
end
