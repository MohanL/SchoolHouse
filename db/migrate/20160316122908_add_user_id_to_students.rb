class AddUserIdToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :user, index: true
    add_foreign_key :students, :users
  end
end
