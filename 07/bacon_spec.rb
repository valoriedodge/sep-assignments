include RSpec

require_relative 'bacon'
require_relative 'node'
require_relative 'movies'

RSpec.describe Baconator, type: Class do
  let (:kevin_bacon) { Node.new("Kevin Bacon", {}) }
  let (:george_clooney) { Node.new("George Clooney", {}) }
  let (:sean_connery) { Node.new("Sean Connery", {}) }
  let (:tom_hanks) { Node.new("Tom Hanks", {}) }
  let (:julia_roberts) { Node.new("Julia Roberts", {}) }
  let (:ben_affleck) { Node.new("Ben Affleck", {}) }
  let (:peter_crombie) { Node.new("Peter Crombie", {}) }
  let (:matt_damon) { Node.new("Matt Damon", {}) }
  let (:hugh_grant) { Node.new("Hugh Grant", {}) }
  let (:toni_collette) { Node.new("Toni Collette", {}) }
  let (:minnie) { Node.new("Minnie Mouse", {}) }

  let(:flatliners) { Movie.new("Flatliners", [kevin_bacon, julia_roberts])}
  let(:eleven) { Movie.new("Ocean's Eleven", [julia_roberts, george_clooney, matt_damon])}
  let(:good_will) { Movie.new("Good Will Hunting", [matt_damon, ben_affleck])}
  let(:apollo) { Movie.new("Apollo 13", [kevin_bacon, tom_hanks])}
  let(:skip) { Movie.new("My Dog Skip", [kevin_bacon, peter_crombie])}
  let(:rising_sun) { Movie.new("Rising Sun", [peter_crombie, sean_connery])}
  let(:notting_hill) { Movie.new("Notting Hill", [julia_roberts, hugh_grant])}
  let(:about_boy) { Movie.new("About a Boy", [hugh_grant, toni_collette])}

  let(:bacon) {Baconator.new(kevin_bacon)}

  before do
    films = [flatliners, eleven, good_will, apollo, skip, rising_sun, notting_hill, about_boy]
    films.each do |film|
      film.actors.each do |actor|
        actor.add_film(film)
      end
    end
  end

  describe "#hash_films_to_array" do
    it "returns array of Julia Roberts films" do
      expect(bacon.hash_films_to_array(julia_roberts.film_actor_hash)).to eq (["Flatliners", "Ocean's Eleven", "Notting Hill"])
    end

    it "returns array of Kevin Bacon films" do
      expect(bacon.hash_films_to_array(kevin_bacon.film_actor_hash)).to eq (["Flatliners", "Apollo 13", "My Dog Skip"])
    end
  end

  describe "#find_kevin_bacon" do
    it "returns film connecting julia_roberts to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(julia_roberts)).to eq ("Flatliners")
    end

    it "returns film connecting peter_crombie to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(peter_crombie)).to eq ("My Dog Skip")
    end

    it "returns film connecting tom_hanks to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(tom_hanks)).to eq ("Apollo 13")
    end

    it "returns film connecting sean_connery to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(sean_connery)).to eq ([{"Rising Sun"=>"Sean Connery"}, {"My Dog Skip"=>"Peter Crombie"}])
    end

    it "returns film connecting matt_damon to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(matt_damon)).to eq ([{"Ocean's Eleven"=>"Matt Damon"}, {"Flatliners"=>"Julia Roberts"}])
    end

    it "returns film connecting ben_affleck to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(ben_affleck)).to eq ([{"Good Will Hunting"=>"Ben Affleck"}, {"Ocean's Eleven"=>"Matt Damon"}, {"Flatliners"=>"Julia Roberts"}])
    end

    it "returns film connecting toni_collette to Kevin Bacon" do
      expect(bacon.find_kevin_bacon(toni_collette)).to eq ([{"About a Boy"=>"Toni Collette"}, {"Notting Hill"=>"Hugh Grant"}, {"Flatliners"=>"Julia Roberts"}])
    end

  end

end
