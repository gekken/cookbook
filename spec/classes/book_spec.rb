require "rspec"
require 'cookbook'
require 'spec_helper'


describe "Cookbook::Book" do

  @ingredients = ['Aleppo pepper',
                  'extra-virgin olive oil',
                  'red wine vinegar',
                  'tomato paste', 'coarse kosher salt',
                  'freshly ground black pepper',
                  'loves garlic, peeled, flattened',
                  'unpeeled lemons; 1 thinly sliced into rounds, 1 cut into wedges for serving',
                  'skinless boneless chicken (thighs and/or breast halves), cut into 1 1/4-inch cubes']

  $ingredients = ['Aleppo pepper',
                  'extra-virgin olive oil',
                  'red wine vinegar',
                  'tomato paste', 'coarse kosher salt',
                  'freshly ground black pepper',
                  'loves garlic, peeled, flattened',
                  'unpeeled lemons; 1 thinly sliced into rounds, 1 cut into wedges for serving',
                  'skinless boneless chicken (thighs and/or breast halves), cut into 1 1/4-inch cubes']

  @units = ['tablespoons', 'cup', 'tablespoons', 'tablespoons', 'tablespoons', 'teaspoons', 'teaspoons', '', '', 'Pounds']

  @directions = "throw it in a pot and stir. Serve lukewarm with flat beer"

  @amounts = [1.5, 3, 2, 2, 2, 1, 6, 2, 2.25]

  $recipe = Cookbook::Recipe.new('aleppo chicken', @ingredients, @units, @amounts, @directions)

  subject { Cookbook::Book.new 'name' }

  context "#new" do
    it "should have a name" do

      subject.name.should == 'name'
    end

    it 'if not supplied a description it should have the default value' do
      subject.description.should == "a cookbook"
    end

    it 'if supplied a description it should return the correct one' do
      book = Cookbook::Book.new 'name', 'argle barlge'
      book.description.should == 'argle barlge'
    end


  end

  context '#list' do
    it "if there are no stored recipes, it should be empty" do
      subject.list.empty?.should be_true
    end

    it 'if we insert recipes it should return them' do

      subject.add_recipe $recipe
      subject.list.should include $recipe
    end

  end

  context '#add_recipe' do
    it 'adds a recipe object' do
      subject.add_recipe($recipe)
      subject.list.should include $recipe
    end

    it 'does not accept a string' do
      recipe = 'this'
      subject.add_recipe recipe
      subject.list.should_not include recipe
    end

  end
end