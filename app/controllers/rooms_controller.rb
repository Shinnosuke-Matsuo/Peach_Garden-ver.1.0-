class RoomsController < ApplicationController
  before_action :matched_users, only: [:create, :show]

  def create
    @room = Room.create(room_params)
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
    @rooms = Room.all
  end

  private
      def room_params
        params.require(:room).permit(:name)
      end

      def matched_users
        if Matching.find_by(micropost_id: Room.find(params[:id]).micropost.id, user_id: current_user.id).nil?
        redirect_to root_path
        # unless @micropost.matching_users.include?(current_user)
        end
      end
end
