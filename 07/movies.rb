class Movie
  attr_accessor :name
  attr_accessor :actors

  def initialize(name, actors)
    @name = name
    @actors = actors
  end

  def add_actor(actor)
    @actors << actor
  end
  
  def print_actors
    @actors.each {|x| puts x.name}
  end
end
