class StudentsController < ApplicationController
  respond_to :json

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
    respond_to do |format|
      if @student.save
        format.json { render json: @student}
        format.html { redirect_to @student }
      else 
        render :new
      end
    end
  end

  def edit
    @student = Student.find(params[:id])
    authorize @student
  end

  def update
    @student = Student.find(params[:id])
    authorize @student
    respond_to do |format|
      if @student.update_attributes(student_params)
        format.json { render json: @student }
        format.html { redirect_to @student }
      else
        render :edit
      end
    end
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
    convert_date if params[:student][:birthday].class == String
    params.require(:student).permit(:name, :birthday, :student_class_id, :user_id)
  end

  def convert_date
    birthday = params[:student][:birthday] 
    params[:student][:birthday] = Date.strptime(birthday, '%m/%d/%Y')
  end

end
