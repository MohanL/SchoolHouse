class RemoveUserIdFromStudentClasses < ActiveRecord::Migration
  def change
    remove_column :student_classes, :user_id
  end
end
