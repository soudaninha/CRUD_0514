class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
  end
  
  def update
    post = Post.find(params[:post_id])
    post.title = params[:post_title]
    post.content = params[:post_content]
    post.save
    
    redirect_to '/home/index'
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.new 
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.user_email= params[:user_email]
    @post.save
  redirect_to '/home/index'
  end

  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    
    redirect_to '/home/index'
  end
  
  def comment_write
        @comment = Comment.new
        @comment.content =params[:content]
        @comment.post_id = params[:post_id]
        @comment.user_email = params[:user_email]
        @comment.save
        redirect_to :back
  end
  
  def comment_destroy
        destroy_comment = Comment.find(params[:comment_id])
        destroy_comment.destroy
        redirect_to :back
  end
end