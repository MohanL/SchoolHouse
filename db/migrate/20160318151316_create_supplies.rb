class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :date_due
      t.string :amount
      t.references :student_class, index: true

      t.timestamps null: false
    end
    add_foreign_key :supplies, :student_classes
  end
end
