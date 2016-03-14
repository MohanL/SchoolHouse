class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.references :student_class, index: true
      t.timestamps null: false
    end
    add_foreign_key :students, :student_class
  end
end
