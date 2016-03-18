admin = User.new
admin.email = 'admin@example.com'
admin.password = 'password'
admin.password_confirmation = 'password'
admin.role = 1
admin.save!

student_class = StudentClass.new
student_class.name = Faker::Lorem.sentence
student_class.min_age = 3
student_class.max_age = 5
student_class.start_date = Faker::Date.forward(40)
student_class.end_date = Faker::Date.between(2.months.from_now, 6.months.from_now)
student_class.start_time = "9:00"
student_class.end_time = "14:00"
student_class.meets_on = ["Mondays", "Wednesdays", "Fridays"]
student_class.save!

supply = student_class.supplies.build
supply.name = Faker::Commerce.department(2, true)
supply.amount = Faker::Commerce.price
supply.date_due = student_class.start_date
supply.save!

student_class2 = StudentClass.new
student_class2.name = Faker::Lorem.sentence
student_class2.min_age = 6
student_class2.max_age = 10
student_class2.start_date = Faker::Date.forward(40)
student_class2.end_date = Faker::Date.between(2.months.from_now, 6.months.from_now)
student_class2.start_time = "9:00"
student_class2.end_time = "16:00"
student_class2.meets_on = ["Tuesdays", "Thursdays"]
student_class2.save!

supply2 = student_class2.supplies.build
supply2.name = Faker::Commerce.department(2, true)
supply2.amount = Faker::Commerce.price
supply2.date_due = student_class2.start_date
supply2.save!

20.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
  num_kids = rand(1..4)
  num_kids.times do
    student = user.students.new
    student.name = Faker::Name.name
    if (num_kids % 2 == 1)
      student.birthday = Faker::Date.between(3.years.ago, 5.years.ago)
      student.student_class = student_class
    else
      student.birthday = Faker::Date.between(6.years.ago, 10.years.ago)
      student.student_class = student_class2
    end
    student.save!
  end
end
