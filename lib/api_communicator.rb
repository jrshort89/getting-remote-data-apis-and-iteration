require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  arr = response_hash["results"].select do |films|
    films["name"] == character_name
    # Luke Skywalker
  end.map do |character|
    character["films"]
  end.flatten
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(list_of_links_to_films)
  # some iteration magic and puts out the movies in a nice list
  list_of_links_to_films.map do |film|
    response_string = RestClient.get(film)
    response_hash = JSON.parse(response_string)
  end.each do |film_data|
    puts "Title: #{film_data["title"]}\n\n"
    puts "Episode: #{film_data["episode_id"]}\n\n"
    puts "Description: #{film_data["opening_crawl"]}\n\n"
  end
  # response_string = RestClient.get('http://swapi.dev/api/people')
  # response_hash = JSON.parse(response_string)
end

def show_character_movies(character)
  film_results_from_method = get_character_movies_from_api(character)
  print_movies(film_results_from_method)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
