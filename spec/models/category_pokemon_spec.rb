require "rails_helper"

RSpec.describe CategoryPokemon, type: :model do
  describe "associations" do
    describe "is association with Category" do
      it { should belong_to(:category)}
    end
    describe "is association with Pokemon" do
      it { should belong_to(:pokemon)}
    end
  end
end