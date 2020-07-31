FactoryBot.define do
  factory :power_generator do
    name     { FFaker::Name.name }
    description { FFaker::AWS.product_description }
    image_url { FFaker::Image.url }
    manufacturer { FFaker::Name.name }
    price { '16347.00' }
    kwp { '3.20' }
    height { '0.58' }
    width { '0.3' }
    lenght { '1.8' }
    weight { '99' }
    structure_type { :laje }
  end
end
