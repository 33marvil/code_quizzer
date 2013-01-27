class FamiliesController < ApplicationController
	load_and_authorize_resource

	def new
	end

	def create
		if @family.save
			redirect_to families_path
		else
			flash[:error] = "Something went wrong"
		end
	end

	def index
	end

	def show
		@family = Family.find(params[:id])
		@topics = @family.topics.includes(:quizzes)
		@topic = Topic.new
	end
end