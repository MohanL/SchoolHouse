class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :student_class
  validates :name, presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true
end
