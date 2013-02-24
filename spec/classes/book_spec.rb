require "rspec"
require 'cookbook'


describe Cookbook::Book do


  context '#new' do
    it 'creates a new, empty cookbook'
  end

  context '#add' do
    it 'it checks to see if there already is a cookbook'
    it 'if not, calls new, and sends a name request to STDOUT'
    it 'it adds supplied recipe to the cookbook'
  end

  context '#rename' do
    it 'renames the file only' #script or method handle std out? if no parameter script, if name, method. too much?
  end

  context '#edit' do
    it 'flashes a warning. something about professionals only and requests confirmation' #annoying?
    it 'opens the file in the default editor'

  end
end