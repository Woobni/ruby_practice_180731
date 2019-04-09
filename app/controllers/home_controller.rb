class HomeController < ApplicationController
  def index
    @posts = Post.all
    # @쓰는 이유는 controller에서 HTML로 넘어가기위해 쓰임
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.save
    
    redirect_to home_path(@post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    
    redirect_to home_index_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end
  
  def comment_delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
