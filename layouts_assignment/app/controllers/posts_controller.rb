class PostsController < ApplicationController
	def index
		@posts = Post.all
		@post = Post.new
		@users = User.all
	end

	def create
		@post = Post.new(post_params)

		respond_to do |format|
	      if @post.save
	        format.html { redirect_to @post, notice: 'Post was successfully created.' }
	        format.json { render :show, status: :created, location: @post }
	      else
	        format.html { render :new }
	        format.json { render json: @post.errors, status: :unprocessable_entity }
	      end
	    end
	end
end