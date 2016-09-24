module StudentClassesHelper

  def attendance_event?(id, status)
    Attendance.where(student_id: id, date: @date, status: status).length > 0 ? true : false
  end

end
