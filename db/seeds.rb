require "json"
require "open-uri"
puts "cleaning seeds"

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
search = URI.open(url).read
movies_results = JSON.parse(search)
movies = movies_results["results"]

puts "starting seeds"

movies.sample(50).each do |movie|
  Movie.create(title: movie["original_title"],
              overview: movie["overview"],
              poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
              rating: rand(0..10))
end

puts "finished"
