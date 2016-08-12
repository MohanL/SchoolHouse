class Attendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_class

  enum status: {
    present: 0,
    absent: 1,
    tardy: 2,
    late_pickup: 3
  }

end
