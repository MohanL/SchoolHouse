require 'rails_helper'
require 'spec_helper'

describe StudentClass do

  it "has a vaild factory" do
    expect(FactoryGirl.build(:student_class)).to be_valid
  end

  it "is invalid without a start date" do
    student_class = FactoryGirl.build(:student_class, start_date: nil)
    student_class.save
    expect(student_class.errors[:start_date].length).to eq(1)
  end

  it "is invalid without an end date" do
    student_class = FactoryGirl.build(:student_class, end_date: nil)
    student_class.save
    expect(student_class.errors[:end_date].length).to eq(1)
  end

  it "is invalid without a start time" do
    student_class = FactoryGirl.build(:student_class, start_time: nil)
    student_class.save
    expect(student_class.errors[:start_time].length).to eq(1)
  end

  it "is invalid without a end time" do
    student_class = FactoryGirl.build(:student_class, end_time: nil)
    student_class.save
    expect(student_class.errors[:end_time].length).to eq(1)
  end

  it "is invalid without a minimum age" do
    student_class = FactoryGirl.build(:student_class, min_age: nil)
    student_class.save
    expect(student_class.errors[:min_age].length).to eq(1)
  end

  it "is invalid without a maximum age" do
    student_class = FactoryGirl.build(:student_class, max_age: nil)
    student_class.save
    expect(student_class.errors[:max_age].length).to eq(1)
  end

  it "is invalid when there are no meeting days" do
    student_class = FactoryGirl.build(:student_class, meets_on: nil)
    student_class.save
    expect(student_class.errors[:meets_on].length).to eq(1)
  end

  it "is invalid when start time comes after end time" do
    student_class = FactoryGirl.build(:student_class, start_time: Time.now, end_time: 2.hours.ago)
    student_class.save  
    expect(student_class.errors[:time].length).to eq(1)
  end

  it "is invalid when start date comes after end date" do
    student_class = FactoryGirl.build(:student_class, start_date: Time.now, end_date: 2.days.ago)
    student_class.save  
    expect(student_class.errors[:date].length).to eq(1)
  end

  it "is invalid when min_age is greater than max age" do
    student_class = FactoryGirl.build(:student_class, min_age: 5, max_age: 3)
    student_class.save  
    expect(student_class.errors[:age].length).to eq(1)
  end
end
