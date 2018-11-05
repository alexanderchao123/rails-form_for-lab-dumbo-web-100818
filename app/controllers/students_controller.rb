class StudentsController < ApplicationController
  def new
    @student = Student.new()
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      # display error message
    end
  end

  def edit
    @student = Student.find_by(id: params[:id])
  end

  def update
    @student = Student.find_by(id: params[:id])
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      # display error
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
