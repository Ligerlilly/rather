FactoryGirl.define do
  factory :user do
    email 't@t.com'
    password 'password'
  end

  factory :question do
  end

  factory :answer do
    picture "http://i.telegraph.co.uk/multimedia/archive/02690/Anne-Guichard_2690182k.jpg"
    body "Body goes here"
    votes 0
  end
end
