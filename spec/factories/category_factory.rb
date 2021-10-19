FactoryBot.define do
  factory :category do
    name { Faker::Book.genre}
    description { "description"}
    id_parent { 1 }
  end
end
