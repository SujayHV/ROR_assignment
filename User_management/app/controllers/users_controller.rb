class UsersController < ApplicationController
	def new
		@User = User.new
	end
	
	def index
		@users=User.all
	end

	def create
		# binding.pry
		@User = User.new(user_params)
		@User.save
		redirect_to users_list_path
	
	end


	def edit
		@User=User.find_by_id(params[:id])
	end


	def update
	@User=User.find_by_id(params[:id])
	@User.update_attributes(user_params)
	redirect_to users_list_path
	end 

	def destroy
		# binding.pry
		@User=User.find_by_id(params[:id])
		@User.destroy
		redirect_to users_list_path
	end
	
	def show
		@User=User.find_by_id(params[:id])
	end


	private
	def user_params
		params.require(:User).permit(:first_name,:last_name,:email,:password)
	end
end