require "rails_helper"

RSpec.describe Category, type: :model do
  it { should have_many(:pokemons)}
  it { should have_many(:category_pokemons)}

  describe "validations" do
    describe "is validates name" do
      it {is_expected.to validate_presence_of(:name)}
    end
    describe "is validates description" do
      it {is_expected.to validate_presence_of(:description)}
    end
  end
end