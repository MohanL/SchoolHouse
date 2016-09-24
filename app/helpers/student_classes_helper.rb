module StudentClassesHelper

  def attendance_event?(id, status)
    return true if Attendance.where(student_id: id, date: @date, status: status)
    nil
  end

end
