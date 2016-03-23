class PostsController < ApplicationController




 def index
  @posts = Post.all.reverse_order
  @post = Post.new
 end

 def create
  @post = Post.new(post_params)
  @post.save
redirect_to :back
 end

 def update
  @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html {  redirect_to '/'}
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

 def edit
  @post = Post.find(params[:id])
 end

 def show
  @post = Post.find(params[:id])
 end

 def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to :back
 end

 private

 def post_params
  params.require(:post).permit(:user_id,:content)
 end



end
