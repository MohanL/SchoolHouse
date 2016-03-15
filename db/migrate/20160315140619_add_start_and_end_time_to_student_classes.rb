class AddStartAndEndTimeToStudentClasses < ActiveRecord::Migration
  def change
    add_column :student_classes, :start_time, :time
    add_column :student_classes, :end_time, :time
  end
end
