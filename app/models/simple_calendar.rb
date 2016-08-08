class SimpleCalendar::BusinessWeekCalendar
  private

    def date_range
      beginning = start_date.beginning_of_week
      ending    = start_date.end_of_week - 2.days
      (beginning..ending)
    end
end
