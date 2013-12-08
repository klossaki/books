require 'active_record'
require 'active_record/fixtures'

namespace :db do
  desc "scholastic rails interview"
  task :populate_db=> :environment  do
  require 'factory_girl'
  require 'faker'

   user = User.new
   user.email = 'guest@scholastic.com'
   user.password = 'guest1234'
   user.password = 'guest1234'
   user.save

   # Populate the book table
   #

    20.times do |n|
      rank_number = Array.new(1){rand(1000..9999)}.join.to_i
      author = FactoryGirl.create(:author)
      author.books <<  FactoryGirl.create(:book, title: Faker::Address.city, rank: rank_number)
    end

    # Update the user_id on book table
    #
    Book.all.each do |book|
      user = User.first
      book.update_attributes(user_id: user.id)
    end
  end
end
