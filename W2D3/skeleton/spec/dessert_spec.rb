require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef", :name => "Eddy") }
  subject(:brownie) {Dessert.new("brownie", 20, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "1", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.add_ingredient("eggs")).to include("eggs")
    end
  end

  describe "#mix!" do
    before(:each) do
      brownie.add_ingredient("eggs")
      brownie.add_ingredient("flour")
      brownie.add_ingredient("sugar")
      brownie.add_ingredient("chocolate")
    end

    it "shuffles the ingredient array" do
      original = brownie.ingredients.dup

      expect(brownie.mix!).not_to eq(original)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(1)).to eq(19)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(21) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Eddy the Great Baker")
      expect(brownie.serve).to include("Chef Eddy the Great Baker")
    end
  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
