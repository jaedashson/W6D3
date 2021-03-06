# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id,
    message: "Artist can only have one artwork with a given name" }
    # Make sure that an artist has no duplicate titles

  belongs_to :artist,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: :User

  has_many :shares, dependent: :destroy,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :shares,
    source: :viewer

end
