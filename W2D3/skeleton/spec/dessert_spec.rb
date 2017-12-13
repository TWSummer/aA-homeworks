require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Theo Summer") }
  subject(:dessert) { Dessert.new("Chocolate", 23, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Chocolate")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(23)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Chocolate", "pie", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("Sugar")
    end

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to eq(["Sugar"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["Sugar", "Water", "Flour", "Corn", "Rice", "Beans"]
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    before(:each) do
      dessert.eat(9)
    end

    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(14)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(1000) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Theo Summer")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake)
      dessert.make_more
    end
  end
end
