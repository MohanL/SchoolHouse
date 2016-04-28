class StudentClassSerializer < ActiveModel::Serializer
  has_many :students, serializer: StudentClassStudentSerializer
  has_many :supplies, serializer: StudentClassSupplySerializer
  attributes :id, :start_time, :end_time, :meets_on, :name, :min_age, :max_age, :start_date, :end_date
end
