require "csv" # Import the CSV library that comes with Ruby

# Remove all data to start.
MovieGenre.delete_all
Genre.delete_all
Movie.delete_all
ProductionCompany.delete_all

filename = File.join(Rails.root, "db", "top_movies.csv")
puts "Loading Movie Data From: #{filename}"
movie_data = File.read(filename)
movies = CSV.parse(movie_data, headers: true)

puts "Loaded #{movies.size} rows from the CSV file."

movies.each do |movie|
  production_company = ProductionCompany.find_or_create_by(name: movie["production_company"])

  if production_company.valid?
    m = production_company.movies.create(
      title:        movie["original_title"],
      year:         movie["year"],
      duration:     movie["duration"],
      description:  movie["description"],
      average_vote: movie["avg_vote"]
    )

    unless m.valid?
      puts "Could not create movie: #{movie['original_title']}"
      next
    end

    genres = movie["genre"].split(", ")
    genres.each do |genre|
      g = Genre.find_or_create_by(name: genre)

      unless g.valid?
        puts "Invalid Genre: #{genre} for movie: #{m.title}"
        next
      end

      MovieGenre.create(movie: m, genre: g)
    end

  else
    puts "Coud not create production company: #{movie['production_company']}"
    puts production_company.errors.messages
  end
end

puts "Created #{ProductionCompany.count} Production Companies"
puts "Created #{Movie.count} Movies"
puts "Created #{Genre.count} Genres"
puts "Created #{MovieGenre.count} Movie Genres"
