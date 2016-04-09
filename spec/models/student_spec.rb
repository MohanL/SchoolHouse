require 'rails_helper'
require 'spec_helper'
 
describe Student do
  it "is valid with a name, birthday, and parental unit" do
    student = Student.new(
      name: 'little dude',
      birthday: DateTime.new(2010, 5, 19),
      user_id: '1')
    expect(student).to be_valid
  end
  it "is invalid without a name" do
    @student = Student.create
    expect(@student.errors[:name].length).to eq(1)
  end
  
  it "is invalid without a birthday" do
    @student = Student.create
    expect(@student.errors[:birthday].length).to eq(1)
  end

  it "is invalid without a parental unit" do
    @student = Student.create
    expect(@student.errors[:user_id].length).to eq(1)
  end
end
