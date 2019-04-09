class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:home_id])
    @post.comments.create(body: params[:comment][:body])
    redirect_to :back
    
    
    #@comment = Comment.create(post_id: @post.id, body: params[:body])
    #create 는 new 랑 save 역할
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
