class StudentsController < ApplicationController
	def index
		@students = Student.all
		@subjects = Subject.all
		@marks = Mark.all
	end

	def new
  		@student = Student.new
			@marks = Mark.new
			@subjects = Subject.all
	end

	def create
		@student = Student.create(students_params)
		if @student.errors.empty?
			redirect_to @student
		else
			render 'new'
		end
	end

	def show
		@student = Student.find(params[:id])
		@subject = Subject.all
		#@subject.each do
				#subjectId = subject.id
				#@mark = Mark.find_by_student_id_and_subject_id(params[:id, :subjectId])
		#end

		@marks = Mark.all
		@mark = Mark.find_by_student_id(params[:id])
	end

	def edit
		@student = Student.find_by_id(params[:id])
	end

	def update
		@student = Student.find_by_id(params[:id])
		@student.update_attributes(students_params)
		if @student.errors.empty?
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
		@student = Student.find_by_id(params[:id])
		@student.destroy
		redirect_to students_path
	end

	private
		def students_params
			params.require(:student).permit(:surname, :name, :email, :group, :birth, :opinion)
		end

end
