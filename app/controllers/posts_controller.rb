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
  	@posts = Post.where("vote_count >= ?", 5)
  end

  def low_rated_index
    @posts = Post.where("vote_count <= ?", 5)
    render 'index'
  end

  def sorted_by_date
    @posts = Post.where("vote_count >= ?", 5).order(created_at: :desc)
    render 'index'
  end

  def sorted_by_votes 
    @posts = Post.where("vote_count >= ?", 5).order(vote_count: :desc)
    render 'index'
  end

  def show
  	@post = Post.find_by_id(params[:id])
  end

  def upvote
  	@post = Post.find_by_id(params[:id])
  	@post.increment(:vote_count)
    @post.save
  	redirect_to('/posts')
  end

  def downvote
  	@post = Post.find_by_id(params[:id])
  	@post.decrement(:vote_count)
    @post.save
  	redirect_to('/posts')
  end

  private 

   def post_params
    	params.require(:post).permit(:title, :gif_url)
   end
end
