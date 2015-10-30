class PostsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  before_action :params_post, only: [:params_post]

  def new
  	@post = Post.new
  end

  def edit
  end

  def index
	  if params[:tag]
	    @posts = Post.tagged_with(params[:tag])
	  else
	  	@posts = Post.all
	  end
  end

  def show
  end

  def create 
  	@post = Post.new(params_post)
  	if @post.save
  		redirect_to @post, notice: "Post was created"
  	else
  		render 'new'
  	end
  end

  def update
  	if @post.update(params_post)
  		redirect_to @post, notice: "Post was updated"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if @post.destroy
  		redirect_to root_path
  	end
  end

  private

  def set_id
  	@post = Post.find(params[:id])
  end

  def params_post
  	params.require(:post).permit(:title, :description, :category, :avatar, :tag_list)
  end
end
