require 'rails_helper'
require 'spec_helper'
 
describe Student do

  it "has a valid factory" do
    expect(FactoryGirl.build(:student)).to be_valid
  end

  it "is invalid without a name" do
    student = FactoryGirl.build(:student, name:nil)
    student.save
    expect(student.errors[:name].length).to eq(1)
  end
  
  it "is invalid without a birthday" do
    student = FactoryGirl.build(:student, birthday:nil)
    student.save
    expect(student.errors[:birthday].length).to eq(1)
  end

  it "is invalid without a parental unit" do
    student = FactoryGirl.build(:student, user_id:nil)
    student.save
    expect(student.errors[:user_id].length).to eq(1)
  end

  it "is invalid with an incorrect birthday"
end
