class StaticPagesController < ApplicationController

  def home
    if logged_in?
     @profile = current_user.profile if logged_in?
     @feed_items = current_user.feed.page(params[:page])
    end
  end

  def help
  end
end
