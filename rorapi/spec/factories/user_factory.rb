FactoryBot.define do
    factory :user do
        name { Faker::Lorem.word }
        bio { Faker::Lorem.word }
        # other properties here
    end
end