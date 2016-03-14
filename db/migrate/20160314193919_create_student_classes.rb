class CreateStudentClasses < ActiveRecord::Migration
  def change
    create_table :student_classes do |t|
      t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :student_classes, :user
  end
end
