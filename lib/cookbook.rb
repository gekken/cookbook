$:.unshift File.expand_path('../lib', __FILE__)


require_relative 'cookbook/version'
require_relative 'cookbook/book'
require_relative 'cookbook/recipe'

require 'colorize'
require 'yaml'

module Cookbook


  def self.storage_path
    if RUBY_PLATFORM =~ /linux|darwin/
      @user = ENV['USER']
      File.expand_path "~/Documents/Cookbook"
    elsif RUBY_PLATFORM =~ /win/
      @user = ENV['USERNAME']
      File.path "C:/Users/#{ENV['USERNAME']}/Documents/Cookbook"
    else
      raise "what are you running this on?!?!"
    end
  end

  $directions = "throw it in a pot and stir. Serve lukewarm with flat beer"

  def self.check(path)
    if File.exist?("#{path}/cookbook.yml")
      Cookbook.welcome
    else
      warn "\t\tPlease run 'cookbook --init' or 'cookbook -i' first.\n\t\tYou can also overwrite previous settings without losing data!".red
    end
  end


  def self.welcome
    puts 'a bunch of instructions'

  end

  def self.init path
    system('clear')

    puts "\n\n\tWe will be writing a config file called 'cookbook.yml' to"
    puts "\t#{path}".green
    puts <<HERE
        But first, we need to get some basic information, such as preferred
        measurement unit, name, and bank account number. umm.. I mean location
        where you want your recipes stored. we recommend
HERE
    puts "\t#{self.storage_path}".green
    print "\tBut that is up to you.\n\tNow first, with whom am I speaking? "
    @name = gets.chomp
    system('clear')

    if @name.downcase != @user
      puts "\n\n\n\t\tYOU LIE!".yellow
      sleep 2
    end

    puts "\n\n\tOutstanding, #{@name.capitalize}; now, what is your preferred unit of measurement?"
    print "\tPlease enter
        'I' for Imperial (cups, fahrenheit, tablespoons) or
        'M' for Metric (liters, centigrade, grams): "

    @unit = gets.upcase.chomp

    system('clear')
    puts "\n\n\tSuper."
    puts "\tDo you want us to store your recipes in #{self.storage_path}?"
    print "\t\t[Y\\n]>"
    path_ans = gets.downcase.chomp

    if path_ans =~ /^n/i
      puts "\n\n\twhere would you like your recipes to be stored?"
      @storage_path = File.open(File.expand_path(gets.downcase.chomp))
      puts @storage_path
    else
      puts 'yup'
    end


  end

end
