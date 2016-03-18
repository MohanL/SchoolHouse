class StudentClass < ActiveRecord::Base
  has_many :students
  has_many :supplies, dependent: :destroy
  accepts_nested_attributes_for :supplies
  serialize :meets_on
  before_validation do |model|
    model.meets_on.reject!(&:blank?) if model.meets_on
  end

  def class_name
    "#{self.name} - ages #{min_age} to #{max_age}"
  end

  def supplies_attributes=(attr)
    attr.values.each do |supply|
      self.save
      s = self.supplies.find_or_create_by(name: supply[:name])
      s.update(name: supply[:name], amount: supply[:amount], date_due: self.start_date)
    end
  end

  def self.pretty_time(time)
    time.strftime "%l:%M %P"
  end
end
