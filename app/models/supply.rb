class Supply < ActiveRecord::Base
  belongs_to :student_class
  validates :name, presence: true
  validates :amount, presence: true
  validates :student_class_id, presence: true
  validates :date_due, presence: true

  def set_due_date(student_class)
    self.date_due = StudentClass.find(student_class).start_date
  end
end

