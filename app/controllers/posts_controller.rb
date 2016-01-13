class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.paginate(page: params[:page])
  end
  
  def show
    @posts = Post.find(params[:id])
    puts @posts.metadata.inspect
    puts @posts.metadata.to_yaml
  end 
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content, :book)
    end

end
