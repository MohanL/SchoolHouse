class AddNameToStudentClasses < ActiveRecord::Migration
  def change
    add_column :student_classes, :name, :string
  end
end
