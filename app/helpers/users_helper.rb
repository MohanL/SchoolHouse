module UsersHelper

  def today_classes(date)
    today = {}
    today[:date] = date
    today[:classes] = []
    StudentClass.current_month(date).each do |student_class|
      if student_class.meets_on.any?{|day| /#{date.strftime('%A')}/.match(day) } 
        today[:classes] << student_class
      end
    end
    binding.pry
  end
end
