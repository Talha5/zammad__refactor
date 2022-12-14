FactoryBot.define do
  factory :authorization do
    transient do
      user { create(:customer) }
    end

    factory :twitter_authorization do
      provider { 'twitter' }
      uid      { Faker::Number.number(digits: 10) }
      username { Faker::Internet.username }
      user_id  { user.id }
    end
  end
end
