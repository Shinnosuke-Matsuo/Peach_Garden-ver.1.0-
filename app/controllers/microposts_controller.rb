class MicropostsController < ApplicationController
   before_action :logged_in_user, only: [:create, :destroy, :edit]

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
   end

   def edit
   end

   private
      def micropost_params
        params.require(:micropost).permit(:content)
      end
end
