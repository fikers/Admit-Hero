class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :destroy]
	before_action :admin_user, only: [:index, :destroy]

	def index
  		@users = User.paginate(page: params[:page])
  	end

  	def new
  		@user = User.new
  	end

  	def show
  		@user = User.find(params[:id])
  	end

  	def basic_info
  		@user = User.find(params[:id])
  	end

  	def tags
  		@tags = User.find(params[:id]).tag
  	end

  	def update_tags
  		@tags = User.find(params[:id]).tag
  		if @tags.update_attributes(tag_params)
  			flash[:success] = "Updated"
  			redirect_to tags_user_url
  		else
  			flash[:danger] = "Update failed, please make sure you are logged in."
  		end
  	end

  	def create
  		@user = User.new(user_params)
  		if @user.save
  			@user.send_activation_email
  			flash[:info] = "Please check your mailbox to finish the account activation"
  			redirect_to root_url
  		else
  			render "new"
  		end
  	end

  	def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
	end

  	private

  		def user_params
  			params.require(:user).permit(:name, :email, :password, :password_confirmation)
  		end

  		def tag_params
  			params.require(:tag).permit(:summer_programs, :scholarships, :stem, :humanities,
  										:computer_science, :traveling, :community_service,
  										:research, :internships, :arts)
  		end

  		def logged_in_user
  			unless logged_in?
  				flash[:danger] = "Please login first."
  				redirect_to login_url
  			end
  		end

  		def admin_user
  			redirect_to(root_url) unless current_user.admin?
  		end

end
