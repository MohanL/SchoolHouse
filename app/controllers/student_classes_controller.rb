class StudentClassesController < ApplicationController
  before_action :find_student_class, only: [:show, :edit, :update, :destroy]

  def index
    @student_classes = StudentClass.all
  end

  def new
    @student_class = StudentClass.new
    @student_class.supplies.build
    authorize @student_class
    respond_to do |format|
      format.html { render :new }
      format.js {}
    end
  end

  def create
    convert_times
    @student_class = StudentClass.new(student_class_params)
    authorize @student_class
    if @student_class.valid?
      @student_class.save
      respond_to do |format|
        format.html { redirect_to @student_class, notice: "Class Successfully Created" }
        format.js {}
      end
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @student_class
    respond_to do |format|
      format.html { render :edit }
      format.js {}
    end
  end

  def update
    convert_times 
    authorize @student_class
    if @student_class.valid?
      respond_to do |format|
        if @student_class.update_attributes(student_class_params)
          format.html { redirect_to @student_class, notice: "Class Successfully Updated" }
          format.js {}
        end
      end
    else
      render :edit
    end
  end

  def destroy
    authorize @student_class
    @student_class.delete
    redirect_to student_classes_path
  end

  private

    def find_student_class
      @student_class = StudentClass.find(params[:id])
    end

    def convert_times
      params[:student_class].parse_time_select! :start_time
      params[:student_class].parse_time_select! :end_time
      params[:student_class][:start_date].gsub!(/\//, '-')
      params[:student_class][:end_date].gsub!(/\//, '-')
      if params[:student_class][:start_date].length <= 10
        params[:student_class][:start_date] = DateTime.strptime(params[:student_class][:start_date], '%m-%d-%Y')
      end
      if params[:student_class][:end_date].length <= 10
        params[:student_class][:end_date] = DateTime.strptime(params[:student_class][:end_date], '%m-%d-%Y')
      end
    end

    def student_class_params
      params.require(:student_class).permit(:name, :min_age, :max_age, :start_date, :end_date, :start_time, :end_time, :meets_on => [], supplies_attributes: [:name, :amount])
    end
end
