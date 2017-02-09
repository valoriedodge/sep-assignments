class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize(name, hash)
    @name = name
    @film_actor_hash = hash
  end
  def add_film(film)
    @film_actor_hash[film.name] = film.actors
  end
end
