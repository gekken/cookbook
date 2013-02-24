require "rspec"
require 'cookbook'
require 'cookbook/recipe'

describe Cookbook::Recipe do

  context "#new" do
    it 'takes one parameter only'

    it 'the parameter is a filename'

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
  end


end
