require "rspec"
require 'cookbook'
require 'cookbook/recipe'
require_relative '../spec_helper'

describe Cookbook::Recipe do

  subject = Cookbook::Recipe.new 'aleppo chicken', Ingredients, Units, Amounts, Directions

  context "#new" do
    it "should have a name" do
      subject.name.should == 'aleppo chicken'
    end

    it "should have a list of ingredients" do
      subject.ingredients.should == Ingredients
    end

    it 'should have a list of units' do
      subject.units.should == Units
    end

    it 'should have a list of amounts' do
      subject.amounts.should == Amounts
    end

    it 'should have directions' do
      subject.directions.should == Directions
    end

    it 'should reorganize the recipe into a hash' do
      subject.parsed.should == Hashed
    end

  end

  context '#save' do
    it 'should save the recipe to the correct book' do
    book =  'KEEPER'
    subject.save(book).should == Cookbook::Book.search('aleppo', book)
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
    it 'takes one parameter only' do
      #subject.edit 'aleppo chicken'.should
    end


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
