require "rspec"
require 'cookbook'
require 'cookbook/recipe'

describe Cookbook::Recipe do
  $ingredients = ['Aleppo pepper',
                  'extra-virgin olive oil',
                  'red wine vinegar',
                  'tomato paste', 'coarse kosher salt',
                  'freshly ground black pepper',
                  'loves garlic, peeled, flattened',
                  'unpeeled lemons; 1 thinly sliced into rounds, 1 cut into wedges for serving',
                  'skinless boneless chicken (thighs and/or breast halves), cut into 1 1/4-inch cubes']

  $units = ['tablespoons', 'cup', 'tablespoons', 'tablespoons', 'tablespoons', 'teaspoons', 'teaspoons', nil, 'Pounds']


  $amounts = [1.5, 3, 2, 2, 2, 1, 6, 2, 2.25]

  $hash = {"Aleppo pepper" => [1.5, "tablespoons"],
           "extra-virgin olive oil" => [3, "cup"],
           "red wine vinegar" => [2, "tablespoons"],
           "tomato paste" => [2, "tablespoons"],
           "coarse kosher salt" => [2, "tablespoons"],
           "freshly ground black pepper" => [1, "teaspoons"],
           "loves garlic, peeled, flattened" => [6, "teaspoons"],
           "unpeeled lemons; 1 thinly sliced into rounds, 1 cut into wedges for serving" =>
               [2, nil],
           "skinless boneless chicken (thighs and/or breast halves), cut into 1 1/4-inch cubes" =>
               [2.25, "Pounds"]}

  $directions = "throw it in a pot and stir. Serve lukewarm with flat beer"

  subject = Cookbook::Recipe.new 'aleppo chicken', $ingredients, $units, $amounts, $directions

  context "#new" do
    it "should have a name" do
      subject.name.should == 'aleppo chicken'
    end

    it "should have a list of ingredients" do

      subject.ingredients.should == $ingredients
    end

    it 'should have a list of units' do
      subject.units.should == $units
    end

    it 'should have a list of amounts' do
      subject.amounts.should == $amounts
    end

    it 'should have directions' do
      subject.directions.should == $directions
    end

    it 'should reorganize the recipe into a hash' do
      subject.should == $hash
    end

  end

  context '#save' do
    it 'should save the recipe to the correct book' do
      subject.save 'name'.should be_true
    end

  end

  context '#search' do

    it 'takes one parameter only'

    it 'returns the name of the recipe if found'

    it 'returns false if the recipe is not found'

  end

  context '#show' do
    it 'takes up to two parameters, the name and an optional switch'

    it 'if no switch, the recipe is written to STDOUT'

    it 'if the switch is supplied, #edit is called'

  end


  context '#edit' do
    it 'takes one parameter only'

    it 'the parameter is a recipe name'

    it 'opens the recipe in the default editor'

  end

  context '#delete' do

    it 'takes one parameter only'

    it 'deletes the specified recipe by name'

    it 'the recipe is no longer there'
    #Cookbook::Recipe.search('@deleted').should be_false
  end
end
