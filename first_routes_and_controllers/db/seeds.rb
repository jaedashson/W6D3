# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create!(username: 'Jeff_1')
user2 = User.create!(username: 'Billyray55')
user3 = User.create!(username: 'MarvelLover4')
user4 = User.create!(username: 'Catsrus53')

art1 = Artwork.create!( title: "Trees of Cotton Candy", image_url: "cotton.jpg", artist_id: user1.id )
art2 = Artwork.create!( title: "Kittyans Jones and the repurrrsion of Death", image_url: "kitty.jpg", artist_id: user2.id )
art3 = Artwork.create!( title: "What's Covid got to do with it?", image_url: "covid.jpg", artist_id: user3.id )
art4 = Artwork.create!( title: "That's my purse, I don't know know you", image_url: "bobby.jpg", artist_id: user4.id )

share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user1.id)
share2 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: user1.id)
share3 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: user1.id)
share4 = ArtworkShare.create!(artwork_id: art4.id, viewer_id: user1.id)


 