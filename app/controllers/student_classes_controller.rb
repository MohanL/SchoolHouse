class StudentClassesController < ApplicationController
  before_action :find_student_class, only: [:show, :edit, :update, :destroy]

  def index
    @student_classes = StudentClass.all
  end

  def new
    @student_class = StudentClass.new
    authorize @student_class
  end

  def create
    @student_class = StudentClass.new(student_class_params)
    authorize @student_class
    @student_class.save
    redirect_to @student_class
  end

  def show
  end

  def edit
    authorize @student_class
  end

  def update
    authorize @student_class
    @student_class.update_attributes(student_class_params)
  end

  def destroy
    authorize @student_class
    @student_class.delete
  end

  private

    def find_student_class
      @student_class = StudentClass.find(params[:id])
    end

    def student_class_params

      params.require(:student_class).permit(:name, :min_age, :max_age, :start_date, :end_date, :start_time, :end_time, :meets_on => [])
    end
end
