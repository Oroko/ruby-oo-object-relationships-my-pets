# frozen_string_literal: true

require 'pry'
class Owner
  @@all = []
  attr_reader :name, :species
  def initialize(name, species = 'human')
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    cats << Cat.new(name, self)
    # binding.pry
  end

  def buy_dog(name)
    dogs << Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = 'happy' }
  end
  
  def feed_cats 
    cats.each { |cat| cat.mood = 'happy' }
  end

  def sell_pets
    dogs.each { |dog| dog.mood = 'nervous' }
    cats.each { |cat| cat.mood = 'nervous' }
    dogs.each { |dog| dog.owner = nil }
    cats.each { |cat| cat.owner = nil }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
