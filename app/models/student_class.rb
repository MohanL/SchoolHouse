class StudentClass < ActiveRecord::Base
  has_many :students
  has_many :supplies, dependent: :destroy
  has_many :tuitions, dependent: :destroy
  has_many :attendances
  accepts_nested_attributes_for :supplies
  accepts_nested_attributes_for :attendances
  serialize :meets_on
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :min_age, presence: true
  validates :max_age, presence: true
  validates :meets_on, presence: true
  validate :student_class_validator
  before_validation do |model|
    model.meets_on.reject!(&:blank?) if model.meets_on
  end

  def class_name
    "#{self.name} - ages #{min_age} to #{max_age}"
  end

  def supplies_attributes=(attr)
    if self.valid?
      self.save
      attr.values.each do |supply|
        s = self.supplies.find_or_create_by(name: supply[:name])
        s.update(name: supply[:name], amount: supply[:amount], date_due: self.start_date)
      end
    end
  end

  def students_attributes=(attrs)
    binding.pry
    # attrs.values.each do |att|
    #   student = Student.find(att[:id])
    #   student.status = att[:status] if att[:status]
    # end
  end

  def self.pretty_time(time)
    time.strftime "%l:%M %P"
  end

  def student_class_validator
    if (start_time && end_time && min_age && max_age && start_date && end_date && meets_on)
      if start_time > end_time
        errors[:time] << "Start time must be before end time"
      end
      if min_age > max_age
        errors[:age] << "Min age must be less than or equal to max age"
      end
      if start_date > end_date
        errors[:date] << "Start date must come before end date"
      end
      if meets_on.length == 0
        errors[:meets] << "Must choose at least one day of the week"
      end
    end
  end

  def self.current_month(date)
    StudentClass.where("start_date < ? AND end_date > ?", date, date)
  end

end

