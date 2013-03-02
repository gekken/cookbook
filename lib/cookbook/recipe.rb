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
      goods = Hash[@ingredients.zip amts]
      goods['name'] = @name
      goods
    end

    def save to_book
      begin
        File.open("#{Cookbook.storage_path}/#{to_book}", 'r+') do |f|
          f << (self.parsed).to_yaml
        end
      rescue
        puts "There doesn't appear to be a cookbook called #{to_book}"
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
end
