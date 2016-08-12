class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :status
      t.integer :student_id
      t.integer :student_class_id
      t.date :date
      t.timestamps null: false
    end
  end
end
