require "rails_helper"

RSpec.describe Pokemon, type: :model do
  it { should have_many(:categories)}
  it { should have_many(:category_pokemons)}

  describe "validations" do
    describe "it validates name" do
      it {is_expected.to validate_presence_of(:name)}
    end
    describe "it validates description" do
      it {is_expected.to validate_presence_of(:description)}
    end
    describe "it validates height" do
      it { is_expected.to validate_presence_of(:height)}
    end
    describe "it validates weight" do
      it { is_expected.to validate_presence_of(:weight)}
    end
    describe "it validates skill" do
      it {is_expected.to validate_presence_of(:skill)}
    end
    describe "it validates image" do
      it {is_expected.to validate_presence_of(:image)}
    end
  end
end