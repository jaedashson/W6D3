# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :artworks, dependent: :destroy,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: :Artwork

  has_many :shares, dependent: :destroy,
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
