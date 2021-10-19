FactoryBot.define do
  factory :pokemon do
    name {Faker::Name.name}
    description {"description"}
    height {50}
    weight {30}
    skill {"power"}
    image {"image"}
  end
end