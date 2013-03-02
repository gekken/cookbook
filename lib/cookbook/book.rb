module Cookbook


  class Book
    # To change this template use File | Settings | File Templates.

    attr_accessor :name, :description


    def initialize name, description="a cookbook"
      @name = name
      @description = description
      @recipes =[]
      @file = "#{Cookbook.storage_path}/#{@name}"
    end

    def list
      @recipes
    end

    def add_recipe recipe
      @recipes << recipe unless recipe.class != Cookbook::Recipe
    end

    def save
      Dir.mkdir Cookbook.storage_path, 0776 unless Dir.exist? Cookbook.storage_path
      File.new(@file) unless !File.exist?(@file)
      File.open(@file, 'w') do |f|
        f.write @description
        f << @recipes.to_yaml
      end
    end

    def self.open name

    end

    def search (recipe, book)
      holder = []
      yml = YAML.load_file "#{Cookbook.storage_path}/#{book}"
      yml.each_pair do |k, v|
        if k == 'name' and v =~ /"#{recipe}"/i
          holder << recipe
        end
      end
    end


  end
end


