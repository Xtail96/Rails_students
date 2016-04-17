class MarksController < ApplicationController
	def new
		@student = Student.find(params[:student_id])
		@marks = @student.marks.build
	end
end