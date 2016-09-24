class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :student_class
  has_many :attendances
  validates :name, presence: true
  validates :birthday, presence: true
  validates :user_id, presence: true

  def status=(attr)
    attendance = self.attendances.find_or_create_by(:date => attr[:date])
    attendance.status = attr[:status]
    attendance.save
  end

  def status
    #this is currently here just to provide nested form data
  end

  def date
    #this is currently here just to provide nested form data
  end
end
