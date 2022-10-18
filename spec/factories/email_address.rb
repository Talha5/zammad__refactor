FactoryBot.define do
  factory :email_address do
    association :channel, factory: :email_channel
    sequence(:email)    { |n| "tts#{n}@localhost.com" }
    sequence(:realname) { |n| "tts#{n}" }
    created_by_id       { 1 }
    updated_by_id       { 1 }
  end
end
