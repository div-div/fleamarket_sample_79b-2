FactoryBot.define do

  factory :image do
    # image_url                     {"1"}
    image_url                        {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end
end
