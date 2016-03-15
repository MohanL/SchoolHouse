class AddMeetsOnToStudentClasses < ActiveRecord::Migration
  def change
    add_column :student_classes, :meets_on, :string
  end
end
