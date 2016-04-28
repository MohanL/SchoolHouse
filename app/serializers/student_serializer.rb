class StudentSerializer < ActiveModel::Serializer
  has_one :user
  has_one :student_class
  attributes :id, :name, :birthday, :user_id
end
