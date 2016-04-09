class StudentClass < ActiveRecord::Base
  has_many :students
  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies
  serialize :meets_on
  validates :name, presence: true
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

  def self.pretty_time(time)
    time.strftime "%l:%M %P"
  end

  def student_class_validator
    if start_time > end_time
      errors[:base] << "Start time must be before end time"
    end
    if min_age > max_age
      errors[:base] << "Min age must be less than or equal to max age"
    end
    if start_date > end_date
      errors[:base] << "Start date must come before end date"
    end
    if meets_on.length == 0
      errors[:base] << "Must choose at least one day of the week"
    end
  end

end

