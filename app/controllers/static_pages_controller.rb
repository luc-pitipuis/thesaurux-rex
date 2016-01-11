class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    #@posts = @Post.paginate(page: params[:page])
    @post = current_user.posts.build
    @posts = current_user.posts.all
  end

  def help
  
  end
  
  def about
  end
  
  def contact
  end
end
