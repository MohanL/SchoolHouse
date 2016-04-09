require 'rails_helper'
require 'spec_helper'

describe Supply do
  it "is valid with a name, date_due, amount, student_class" do
    supply = Supply.new(
      name: 'Art supplies',
      date_due: '04/19/2015',
      amount: '100',
      student_class_id: '1')
    expect(supply).to be_valid
  end
  
  it "is invalid without a name" do
    @supply = Supply.create()
    expect(@supply.errors[:name].length).to eq(1)
  end

  it "is invalid without an amount" do
    @supply = Supply.create
    expect(@supply.errors[:amount].length).to eq(1)
  end

  it "is invalid with invalid amount data" 
  #something like, need to trip dollar signs or whatever
  
  it "is invalid without a student_class" do
    @supply = Supply.create
    expect(@supply.errors[:student_class_id].length).to eq(1)
  end

  it "is invalid with incorrect student_class"
  #check to see if StudentClass.find(@supply.student_class_id) is a real class
 
  it "is invalid without a date due" do
    @supply = Supply.create
    expect(@supply.errors[:date_due].length).to eq(1)
  end

  it "is invalid with incorrect date due"
  #probably need to convert the date due in the db from a string to a DateTime
  #object.  Then check to make sure it's a correct date due.  can't be in the
  #past, too.
  




end
