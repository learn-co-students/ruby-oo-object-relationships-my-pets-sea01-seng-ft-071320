require 'pry'
class Owner
attr_reader :name, :species
@@all = []
@@count =0

  def initialize(name, species= "human")
    @name = name
    @species = species
    @@all << self
    @@count +=1
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0 
    @@all = []
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map do |dog| 
      dog.name == name
      dog.mood = "happy"
    end
  end

    def feed_cats
      Cat.all.map do |cat| 
        cat.name == name
        cat.mood = "happy"
      end
    end

    def sell_pets
      Cat.all.map do |cat| 
        cat.name == name 
        cat.mood = "nervous"
        cat.owner = nil
      end
      Dog.all.map do|dog| 
        dog.name == name 
        dog.mood = "nervous"
        dog.owner = nil
      end
    end

    def list_pets
      cat_list = Cat.all.count {|cat| cat.owner == self}
      dog_list = Dog.all.count {|dog| dog.owner == self}

      "I have #{dog_list} dog(s), and #{cat_list} cat(s)."
    end

end

