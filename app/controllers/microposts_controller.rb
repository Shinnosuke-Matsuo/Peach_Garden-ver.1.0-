class MicropostsController < ApplicationController
   before_action :logged_in_user, only: [:create, :destroy, :edit]
   before_action :correct_user,   only: :destroy

   def new
     @micropost = Micropost.new
   end

   def create
     @micropost = current_user.microposts.build(micropost_params)
     if !(current_user.role == "entrepreneur")
       render root_url
     elsif @micropost.save
       flash[:success] = "Micropost created!"
       redirect_to root_path
     else
       render 'static_pages/home'
     end
   end

   def index
     @microposts = Micropost.page(params[:page])
   end

   def destroy
     @micropost.destroy
     flash[:success] = "Micropost deleted"
     redirect_to request.referrer || root_url
   end

   def edit
   end

   private
      def micropost_params
        params.require(:micropost).permit(:content)
      end

      def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
      end
end
