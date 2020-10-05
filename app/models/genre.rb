class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  validates :name, presence: true

  # genre_object.movies
end
