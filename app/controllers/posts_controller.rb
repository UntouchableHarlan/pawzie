class PostsController < ApplicationController
  def index
    @posts = Post.all
    @nearby = User.near([current_user.latitude, current_user.longitude])
    @user = current_user
    @post = Post.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = current_user.posts.new(posts_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.json { render status: :created }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def posts_params
    params.require(:post).permit(:image, :caption, :pet_id)
  end
end
