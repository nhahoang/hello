require 'spec_helper'

describe Book do

  it "has a valid factory" do
    FactoryGirl.create(:book).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:book, title: nil).should_not be_valid
  end

  it "is invalid without a year" do
    FactoryGirl.build(:book, year: nil).should_not be_valid
  end

  it "is invalid without search" do
    book1 = FactoryGirl.build(:book, title: "Tinh Thay Tro", year: 2012, category_id: 1, author_id: 1)
    book2 = FactoryGirl.build(:book, title: "Hay Tim Toi", year: 2012, category_id: 1, author_id: 1)
    book3 = FactoryGirl.build(:book, title: "Nhat Ky", year: 2012, category_id: 1, author_id: 1)
    Book.search("thay").should == [ book1 ]
  end

end