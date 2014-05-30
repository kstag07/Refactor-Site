class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post
  #before_action :authenticate_user!, except: [:show ]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = @post.comments.build(comment_params)
  end

  def edit
  end

  def create
    @comment = @post.comments.build(comment_params)
    if current_user.present?
    current_user.comments << @comment
  end
    respond_to do |format|
      if @comment.save

        @post.comments << @comment
        format.html { redirect_to @post, notice: 'Refactor was successfully submitted.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :show }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: 'Refactor was successfully updated.' }
         current_user.posts << @post
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
   params.require(:comment).permit(:author, :author_url, :author_email, :user_ip, :user_agent, :referrer, :content, :post_id, :created_at, :updated_at)
  end
end
