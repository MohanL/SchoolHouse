class SupplySerializer < ActiveModel::Serializer
  has_one :student_class
  attributes :id, :name, :date_due, :amount, :student_class_id
end
