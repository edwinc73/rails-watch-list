# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

require "uri"

require "open-uri"

if User.all.any?
  User.all.each do |user|
    user.destroy
  end
end

if Movie.all.any?
  Movie.all.each do |movie|
    movie.destroy
  end
end

url = URI("https://tmdb.lewagon.com/movie/top_rated?language=en-US&page=1")

image_url = "https://image.tmdb.org/t/p/original/"

res = URI.open(url).read

data = JSON.parse(res)

20.times do |index|
  movie_data = data["results"][index]
  movie = Movie.create(
    title: movie_data["original_title"],
    overview: movie_data["overview"],
    poster_url: image_url + movie_data["poster_path"],
    rating: movie_data["vote_average"]
  )
end

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

user = User.new(
username: "Edwin",
bio: "Frankly, my dear, I don't give a damn"
)

user.profile_picture.attach(io: File.open("user.jpg"), filename: "user.jpg", content_type: "image/jpg")

user.save!
