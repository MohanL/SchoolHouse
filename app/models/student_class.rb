class StudentClass < ActiveRecord::Base
  belongs_to :user
  has_many :students
  serialize :meets_on
end
