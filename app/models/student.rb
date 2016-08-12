class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :student_class
  has_many :attendances
  validates :name, presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true
end
