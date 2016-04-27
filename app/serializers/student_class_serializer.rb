class StudentClassSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :meets_on, :name, :min_age, :max_age, :start_date, :end_date
end
