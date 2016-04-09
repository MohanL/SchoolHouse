class StudentsController < ApplicationController
  def index
    if params[:student_class_id]
      @students = StudentClass.find(params[:student_class_id]).students
    elsif params[:user_id]
      @students = User.find(params[:user_id]).students 
    else
      @students = Student.all
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    authorize @student
    @student.save
    redirect_to @student
  end

  def edit
    @student = Student.find(params[:id])
    authorize @student
  end

  def update
    @student = Student.find(params[:id])
    authorize @student
    @student.update_attributes(student_params)
    redirect_to @student
  end

  def show
    if params[:student_class_id]
      @student = StudentClass.find(params[:student_class_id]).students.find(params[:id])
    else
      @student = Student.find(params[:id])
    end
  end

  def destroy
    @student = Student.find(params[:id])
    authorize @student
    @student.delete
    redirect_to current_user
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :student_class_id, :user_id)
  end
end
