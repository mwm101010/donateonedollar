FactoryBot.define do

factory :campaign do
    title { "hunger" }
    description_short { "It's hard to know" }
    description_full { "Most of third world countries are suffering from hunger" }
    goal { 100 }
    raised { 78 }
  end
end