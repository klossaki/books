require 'active_record'
require 'active_record/fixtures'

namespace :db do
  desc "scholastics rails interview"
  task :populate_db=> :environment  do
  require 'factory_girl'
  require 'faker'

    10.times do |n|
      author = FactoryGirl.create(:author)
      author.books <<  FactoryGirl.create(:book, title: Faker::Address.city)
    end
  end
end
