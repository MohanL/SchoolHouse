require 'rails_helper'
require 'spec_helper'

describe Supply do
  it "has a valid factory" do
    expect(FactoryGirl.build(:supply)).to be_valid
  end

  it "is invalid without a name" do
    supply = FactoryGirl.build(:supply, name: nil)
    supply.save
    expect(supply.errors[:name].length).to eq(1)
  end

  it "is invalid without an amount" do
    supply = FactoryGirl.build(:supply, amount: nil)
    supply.save
    expect(supply.errors[:amount].length).to eq(1)
  end

  it "is invalid with invalid amount data" 
  #something like, need to trip dollar signs or whatever
  
  it "is invalid without a student_class" do
    supply = FactoryGirl.build(:supply, student_class_id: nil)
    supply.save
    expect(supply.errors[:student_class_id].length).to eq(1)
  end

  it "is invalid with incorrect student_class"
  #check to see if StudentClass.find(@supply.student_class_id) is a real class
 
  it "is invalid without a date due" do
    supply = FactoryGirl.build(:supply, date_due: nil)
    supply.save
    expect(supply.errors[:date_due].length).to eq(1)
  end

  it "is invalid with incorrect date due"
  #probably need to convert the date due in the db from a string to a DateTime
  #object.  Then check to make sure it's a correct date due.  can't be in the
  #past, too.

end
