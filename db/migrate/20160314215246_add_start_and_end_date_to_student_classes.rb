class AddStartAndEndDateToStudentClasses < ActiveRecord::Migration
  def change
    add_column :student_classes, :start_date, :date
    add_column :student_classes, :end_date, :date
  end
end
