require 'spec_helper'

describe Book do
  let(:user) { FactoryGirl.create(:user)} 
  let!(:book_1) { FactoryGirl.create(:book_1, user: user)}


  context "validations" do
     it "should not allow two ISBN_10 to have the same numbers" do
       #subject.should have(1).error_on(:isbn_10)
       #book_1.should have(1).error_on(:isbn_10)
       #expect { book_2 }.to raise_error
        book_2 = Book.new(title: 'To Kill a Mockingbird',
                          ISBN_10: 1111111111, #duplicate 
                          ISBN_13: 1987654321098,
                          user_id: user.id,
                          rank: 7654  )
        #book_2.save.should == false
        #expect { book_2}.to raise_error('Isbn 10 has already been taken')
        book_2.should have(1).error_on(:isbn_10)
     end

     it "ISBN_13 should be unique" do
     end

     it "invalid ISBN_10 number" do
     end

 end
end
