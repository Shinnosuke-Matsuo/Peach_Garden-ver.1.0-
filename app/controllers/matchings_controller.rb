class MatchingsController < ApplicationController
  def index
    @matching_topics = current_user.matching_topics
  end

  def create
    matching = Matching.new
    matching.user_id = current_user.id
    matching.micropost_id = params[:micropost_id]
    matching.user2_id = params[:micropost][:user_id]

    if matching.save
      redirect_to microposts_path
      flash[:success] = "matching success"
    else
      redirect_to microposts_path
    end
  end
end
