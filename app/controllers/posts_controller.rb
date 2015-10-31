class PostsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  before_action :set_posts, only: [:index, :category]

  def new
  	@post = Post.new
  end

  def edit
  end

  def index
  end

  def show
  end

  def category
    if params[:category]
      @posts = @posts.select do |f| 
        if f.category == params[:category]
          f
        end
      end
    end
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
  	params.require(:post).permit(:title, :description, :category, :avatar)
  end

  def set_posts
    @posts = Post.all.order("created_at DESC")
  end
end
