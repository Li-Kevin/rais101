class GroupsController < ApplicationController
	def index
		flash[:notice] = "Hi, welcome back!"		
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(group_params)

		if @group.save
			redirect_to groups_path
		else
			render :new
		end
	end

	private

	def group_params
		params.require(:group).permit(:title, :description)
	end
end
