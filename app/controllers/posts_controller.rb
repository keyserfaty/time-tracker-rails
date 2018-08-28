class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # it's checking the content to avoid injection
    
    if @post.save # saves to the db
      redirect_to @post, notice: 'Your post was created succesfully' # just like that redirects the the view of the post just created
    else 
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end
end
