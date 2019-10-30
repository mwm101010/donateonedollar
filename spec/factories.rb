FactoryBot.define do
  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

factory :campaign do
    title { "hunger" }
    description_short { "It's hard to know" }
    description_full { "Most of third world countries are suffering from hunger" }
    goal { 100 }
    raised { 78 }

    association :user
  end
end