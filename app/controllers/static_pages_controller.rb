class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @post = current_user.posts.build
    @posts = current_user.posts.paginate(page: params[:page])
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
