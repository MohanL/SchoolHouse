class StudentClass < ActiveRecord::Base
  has_many :students
  serialize :meets_on
  before_validation do |model|
    model.meets_on.reject!(&:blank?) if model.meets_on
  end

  def class_name
    "#{self.name} - ages #{min_age} to #{max_age}"
  end
end
