module StudentClassesHelper

  def attendance_event?(id, status)
    Attendance.where(student_id: id, date: @date, status: status).length > 0 ? true : false
  end

  def default_option?(id)
    Attendance.where(student_id: id, date: @date).length == 0
  end

end
