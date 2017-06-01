class MarksController < ApplicationController

	def index
		@students = Student.all
		@subjects = Subject.all
		@marks = Mark.all
	end

	def new
		#@student = Student.find(params[:student_id])
		#@marks = @student.marks.build
		@subject_options = Subject.all.map{|t| [ t.subject, t.id ] }
		@student_options = Student.all.map{|u| [ u.name, u.id ] }
		@mark = Mark.new
	end

	def create
		#@mark = @student.marks.create(mark_params)
		@mark = Mark.create(mark_params)
		if @mark.errors.empty?
			redirect_to @mark
		else
			render 'new'
		end
	end

	def show
		@mark = Mark.find(params[:id])
		@marks = Mark.all
	end


	def edit
		@mark = Mark.find_by_id(params[:id])
		@subject_options = Subject.all.map{|t| [ t.subject, t.id ] }
		@student_options = Student.all.map{|u| [ u.name, u.id ] }
	end

	def update
		@mark = Mark.find_by_id(params[:id])
		@mark.update_attributes(mark_params)
		if @mark.errors.empty?
			redirect_to @mark
		else
			render 'edit'
		end
	end

	def destroy
		@mark = Mark.find_by_id(params[:id])
		@mark.destroy
		redirect_to marks_path
	end

	private
		def mark_params
			params.require(:mark).permit(:student_id, :subject_id, :mark, :semestr)
		end
end
