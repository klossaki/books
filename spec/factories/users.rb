
FactoryGirl.define do
  factory :user, class: User do
    email 'guest2@scholastic.com'
    password 'guest1234'
    password_confirmation 'guest1234'
  end
end
