module Cookbook

  class Recipe

    attr_accessor :name, :ingredients, :units, :amounts, :directions

    def initialize(recipe_name, ingredients, units, amounts, directions)
      @name = recipe_name
      @ingredients = ingredients
      @units = units
      @amounts = amounts
      @directions = directions
    end

    def parsed
      amts = @amounts.zip @units
      Hash[@ingredients.zip amts]
    end

    def save name
      Cookbook::Book("").add_recipe
    end


  end

  def edit

  end

  def delete

  end

  def search name
    name
  end

  def show


  end
end
