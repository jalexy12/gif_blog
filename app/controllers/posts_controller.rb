class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create 
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to('/posts')
  	else
  		render(:new)
  	end
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find_by_id(params[:id])
  end

  private 

   def post_params
    	params.require(:post).permit(:title, :gif_url)
   end
end
