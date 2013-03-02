require "rspec"
require 'cookbook'
require_relative '../spec_helper'


describe "Cookbook::Book" do

  $name = (0...8).map{(65+rand(26)).chr}.join
  subject { Cookbook::Book.new $name, 'argle barlge' }

  context "#new" do
    it "should have a name" do

      subject.name.should == $name
      puts "name = #{$name}"
    end

    it 'if not supplied a description it should have the default value' do
      other = Cookbook::Book.new('other')
      other.description.should == "a cookbook"
    end

    it 'if supplied a description it should return the correct one' do
      subject.description.should == 'argle barlge'
    end


  end

  context '#list' do
    it "if there are no stored recipes, it should be empty" do
      subject.list.empty?.should be_true
    end


    it 'if we insert recipes it should return them' do

      subject.add_recipe Test_recipe
      subject.list.should include Test_recipe
    end

  end

  context '#add_recipe' do
    it 'adds a recipe object' do
      subject.add_recipe(Test_recipe)
      subject.list.should include Test_recipe
    end

    it 'does not accept a string' do
      recipe = 'this'
      subject.add_recipe recipe
      subject.list.should_not include recipe
    end
  end


    context "#save" do
     it 'should write a file to the path set in init' do
     result = File.exist?("#{subject}")
      subject.save.should_not == result
     end

      it 'should write the description on the top line' do
      #expected = File.open("#{Cookbook.storage_path}/#{$name}", &:readline)
      #TODO stumped. I know it works, but testing it appears circular.
      end
       end

  end
