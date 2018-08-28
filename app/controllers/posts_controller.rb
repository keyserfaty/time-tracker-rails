class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:date, :rationale)) # it's checking the content to avoid injection
    @post.save # saves to the db

    redirect_to @post # just like that redirects the the view of the post just created
  end

  def show
    @post = Post.find(params[:id])
  end
end
