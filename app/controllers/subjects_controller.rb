class SubjectsController < ApplicationController
	def show
		@subject = Subject.find(params[:id])
	end

	def index
		@subjects = Subject.all
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.create(subject_params)
		if @subject.errors.empty?
			redirect_to @subject
		else
			render 'new'
		end
	end

	def edit
		@subject = Subject.find_by_id(params[:id])
	end

	def update
		@subject = Subject.find_by_id(params[:id])
		@subject.update_attributes(subject_params)
		if @subject.errors.empty?
			redirect_to @subject
		else
			render 'edit'
		end
	end

	def destroy
		@subject = Subject.find_by_id(params[:id])
		@subject.destroy
		redirect_to subjects_path
	end

	private
		def subject_params
			params.require(:subject).permit(:subject)
		end
end
