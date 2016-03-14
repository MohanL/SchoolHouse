class StudentsController < ApplicationController
  def index
    if params[:student_class_id]
      @students = StudentClass.find(params[:student_class_id]).students
    else
      @students = Student.all
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    if params[:student_class_id]
      @student = StudentClass.find(params[:student_class_id]).students.find(params[:id])
    else
      @student = Student.find(params[:id])
    end
  end

  def destroy
  end
end
