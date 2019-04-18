class StaticPagesController < ApplicationController

  def home
    if logged_in?
     @profile = current_user.profiles.build if logged_in?
     @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
