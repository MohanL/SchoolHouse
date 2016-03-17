class ChangeStudentsBirthdayToString < ActiveRecord::Migration
  def change
    change_column :students, :birthday, :string
  end
end
