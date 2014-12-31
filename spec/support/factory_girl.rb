require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :playlist do
    sequence(:title) {|n| "#{n} Dead Man's Blues"}
    sequence(:url) {|n| "http://www.validurl#{n}.com/"}
    description 'This awesome playlist features awesome music from awesome people whose awesomeness knows no bounds. Brah.'
  end

  factory :review do
    rating "5"
    description "Hello there mate yo yo yo yo yea yo yo. "
    user
    playlist
  end
end
