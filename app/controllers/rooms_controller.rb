class RoomsController < ApplicationController
  before_action :matched_users

  def create
    @room = Room.new
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id )
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id ).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
  end

  private
      def matched_users
        @mictopost = Micropost.find_by(params[:id])
        redirect_to root_path unless @micropost.matching_user.include?(current_user)
      end
end
