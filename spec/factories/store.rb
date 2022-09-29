FactoryBot.define do
  factory :store do
    object { 'UploadCache' }
    o_id { 1 }
    preferences { {} }
    created_by_id { 1 }

    factory :store_image do
      data { File.binread(Rails.root.join('test/data/image/1x1.png')) }
      filename { '1x1.png' }
    end
  end
end
