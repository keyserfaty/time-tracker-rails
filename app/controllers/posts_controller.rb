class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # it's checking the content to avoid injection
    @post.user_id = current_user.id

    if @post.save # saves to the db
      redirect_to @post, notice: 'Your post was created succesfully' # just like that redirects the the view of the post just created
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was updated succesfully' # just like that redirects the the view of the post just created
    else
      render :edit
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
