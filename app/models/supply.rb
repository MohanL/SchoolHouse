class Supply < ActiveRecord::Base
  belongs_to :student_class
  validates :name, presence: true
  validates :amount, presence: true
  validates :student_class_id, presence: true
  validates :date_due, presence: true
end

