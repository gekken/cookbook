module Cookbook


  class Book
    # To change this template use File | Settings | File Templates.

    attr_accessor :name, :description


    def initialize name, description="a cookbook"
      @name = name
      @description = description
      @recipes =[]
    end

    def list
      @recipes
    end

    def add_recipe recipe
      @recipes << recipe unless recipe.class != Cookbook::Recipe
    end

    def save path
      File.open()
    end

  end
end

