class Movie < ApplicationRecord
  belongs_to :production_company
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  # movie_object.production_company
  # movie_object.genres

  validates :title, :year, :duration, :description, :average_vote, presence: true
  validates :title, uniqueness: true
  validates :year, :duration, numericality: { only_integer: true }
  validates :average_vote, numericality: true
end
