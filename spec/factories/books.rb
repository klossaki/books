# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :ISBN_10_NUM do |n|
   "#{Array.new(10){rand(1..9)}.join}".to_i
  end

  sequence :ISBN_13_NUM do |n|
   "#{Array.new(13){rand(1..9)}.join}".to_i
  end

  sequence :RANK_NUM do |n|
   "#{Array.new(4){rand(1..4)}.join}".to_i
  end

  factory :book, class: Book do
    title Faker::Address.city
    ISBN_10 { generate(:ISBN_10_NUM) }
    ISBN_13 { generate(:ISBN_13_NUM) }
    rank    { generate(:RANK_NUM) }
  end

  factory :book_1, class: Book do
    title "The Great Gatsby"
    ISBN_10 1111111111
    ISBN_13 2222222222222
    rank 3333
  end
end
