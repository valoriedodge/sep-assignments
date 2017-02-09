# Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]

class Baconator

  def initialize(kevin)
    @kevin = kevin
  end

  def find_kevin_bacon(actor_node)
    first_actor = actor_node
    actor_node_films = actor_node.film_actor_hash.keys
    found = find_intersection(actor_node)
    return found if found
    # For each film that the given actor is in try to find a connection with Kevin Bacon
    actor_node_films.each do |x|
      current_film = x
      actor_list = [actor_node]
      path = [{x => actor_node.name}]
      while found.nil? && actor_list.length < 7
        # Check for the first actor/actress in the film to see if there is a film in common
        count = 0
        first_listed_actor = actor_node.film_actor_hash[current_film][0]
        # Make sure the first actor is not already part of the chain
        while first_listed_actor && path.include?(first_listed_actor)
          count += 1
          first_listed_actor = actor_node.film_actor_hash[current_film][count]
        end
        #If there is another actor/actress to add to the chain, check for a connection
        if first_listed_actor
          found = find_intersection(first_listed_actor)
          actor_node = first_listed_actor
          current_film = (actor_node.film_actor_hash).keys[0]
          actor_list << actor_node
          path << {current_film => actor_node.name}
        else
          break
        end
      end
      return path if found
      actor_node = first_actor
    end
  end

  def print_kevin_movies
    p @kevin.keys
  end

  def hash_films_to_array(hash)
    return hash.keys
  end

  def find_intersection(actor)
    intersection = actor.film_actor_hash.keys & @kevin.film_actor_hash.keys
    intersection.length > 0 ? intersection[0] : nil
  end

end
