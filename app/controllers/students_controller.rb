class StudentsController < ApplicationController
	def index
		@students = Student.all
		@subjects = Subject.all
	end

	def new
  		@students = Student.new
	end

	def create
		@students = Student.create(students_params)
		if @students.errors.empty?
			redirect_to @students
		else
			render 'new'
		end
	end

	def show
		@students = Student.find(params[:id])
	end

	def edit
		@students = Student.edit(params[:id])
	end

	def update
		@students = Student.update(students_params)
		if @students.errors.empty?
			redirect_to @students
		else
			render 'edit'
		end
	end

	private
		def students_params
			params.require(:student).permit(:surname, :name, :email, :group, :birth, :opinion)
		end

end