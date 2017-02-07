Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]
class Baconator

  def find_kevin_bacon(actor_node)
    first_actor = actor_node
    actor_node_films = hash_films_to_array(actor_node.film_actor_hash)
    found = find_intersection(actor_node)
    return found if found
    # For each film that the given actor is in try to find a connection with Kevin Bacon
    for x in 0..(actor_node_films.length -1)
      current_film = hash_films_to_array(actor_node.film_actor_hash)[x]
      path = [current_film]
      while found.nil? && path.length < 7
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
          current_film = hash_films_to_array(actor_node.film_actor_hash)[0]
          path << current_film
        else
          break
        end
      end
      return path if found
      actor_node = first_actor
    end
  end

  def kevin_bacon_films
    kevin_array = []
    Kevin_Bacon.film_actor_hash.each do |key, array|
      kevin_array << key
    end
    return kevin_array
  end

  def hash_films_to_array(hash)
    hash_films = []
    hash.each do |key, array|
      hash_films << key
    end
    return hash_films
  end

  def find_intersection(actor)
    actor_array = hash_films_to_array(actor.film_actor_hash)
    kevin_array = kevin_bacon_films
    intersection = actor_array & kevin_array
    intersection.length > 0 ? intersection[0] : nil
  end

end
