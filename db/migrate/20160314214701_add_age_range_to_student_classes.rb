class AddAgeRangeToStudentClasses < ActiveRecord::Migration
  def change
    add_column :student_classes, :min_age, :integer
    add_column :student_classes, :max_age, :integer
  end
end
