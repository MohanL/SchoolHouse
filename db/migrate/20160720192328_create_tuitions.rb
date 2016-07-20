class CreateTuitions < ActiveRecord::Migration
  def change
    create_table :tuitions do |t|
      t.decimal :cost
      t.integer :student_class_id
      t.datetime :due_date
      t.timestamps null: false
    end
  end
end
