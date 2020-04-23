class ArtworkShare < ApplicationRecord
  # validates :artwork_id, presence: true
  # validates :viewer_id, presence: true
  validates :viewer_id, uniqueness: { scope: :artwork_id,
    message: "Artwork can only be shared with a user once" }

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

end
