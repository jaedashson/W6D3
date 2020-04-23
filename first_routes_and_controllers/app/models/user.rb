class User < ApplicationRecord
  # validates :name, presence: true
  # validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  
  has_many :artworks,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: :Artwork

  has_many :shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :shares,
    source: :artwork

  # has_many :shares_of_users_artworks,
  #   through: :artworks,
  #   source: :shares

  # has_many :artworks_that_have_been_shared,
  #   through: :shares_of_users_artworks,
  #   source: :artwork

end