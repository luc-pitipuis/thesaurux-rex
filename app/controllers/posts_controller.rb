class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page])
  end
  
  def show
    @posts = Post.find(params[:id])
  end 
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

end
