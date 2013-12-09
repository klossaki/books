require 'spec_helper'

describe Book do
  let(:user) { FactoryGirl.create(:user)} 
  let!(:book_1) { FactoryGirl.create(:book_1, user: user)}

  describe "#save" do
     it "does not save a duplicated ISBN_10 number" do

        book_2 = Book.new(title: 'To Kill a Mockingbird',
                          ISBN_10: 1111111111, #duplicated value
                          ISBN_13: 2222222222223,
                          user_id: user.id,
                          rank: 7654  )
        book_2.save.should == false
     end

     it "does not save a duplicated ISBN_13 number" do

        book_2 = Book.new(title: 'To Kill a Mockingbird',
                          ISBN_10: 1111111112, 
                          ISBN_13: 2222222222222, #duplicated value
                          user_id: user.id,
                          rank: 7654  )
        book_2.save.should == false
     end
  end

  context "validations" do
    it "fails validation with duplicate ISBN_10 number" do
                book_3 =  FactoryGirl.build(:book_1,  
                           ISBN_10: 1111111111, #duplicated value
                           ISBN_13: 2222222222223,
                           rank: 1111,
                           user: user)

      book_3.should have(1).error_on(:ISBN_10) # 1 Error: Isbn 10 has already been taken
    end

    it "fails validation with duplicate ISBN_13 number" do
          book_4 =  FactoryGirl.build(:book_1,
                     ISBN_10: 1111111112, 
                     ISBN_13: 2222222222222, #duplicate value
                     rank: 1111,
                     user: user)

      book_4.should have(1).error_on(:ISBN_13) # 1 Error: Isbn 13 has already been taken 
    end

    it "fails validation with a non-integer ISBN_10 number" do
                book_5=  FactoryGirl.build(:book_1,  
                           ISBN_10: 'a111111112', #non-integer value
                           ISBN_13: 2222222222223,
                           rank: 1111,
                           user: user)

      book_5.should have(2).errors_on(:ISBN_10) # 2 Errors: wrong length and not a number
    end
  end
end
