class ChangeStudentsBirthdayToDate < ActiveRecord::Migration
  def change
    change_column :students, :birthday, :date
  end
end
