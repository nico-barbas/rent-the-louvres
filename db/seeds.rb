# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

# la collection: donne un array avec tous les ID de leurs oeuvres
# https://collectionapi.metmuseum.org/public/collection/v1/objects
# liste des départements:
# https://collectionapi.metmuseum.org/public/collection/v1/departments

Image.destroy_all
Artwork.destroy_all
User.destroy_all

louvre_admin = User.new(first_name: "Louvre", last_name: "admin", email: "louvre@admin.com", password: "louvre")
louvre_admin.save
p louvre_admin

all_artworks_url = "https://collectionapi.metmuseum.org/public/collection/v1/objects?departmentIds=11|9"
artworks_serialized = URI.open(all_artworks_url).read
all_artworks = JSON.parse(artworks_serialized)
artworks_ids = all_artworks["objectIDs"].sample(10)

artworks_ids.each do |artwork_id|
  url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{artwork_id}"
  artwork_serialized = URI.open(url).read
  artwork = JSON.parse(artwork_serialized)
  if artwork["primaryImage"] != "" && artwork["dimensions"] != ""
    title = artwork["title"]
    creator_name = artwork["artistDisplayName"]
    creation_date = artwork["objectDate"]
    dimensions = artwork["dimensions"]
    primary_image = artwork['primaryImage']
    medium = artwork["objectName"]
    description = "this #{artwork["medium"]} from #{creator_name} was made in #{artwork["country"]}.It perfectly
    represents the #{artwork["period"]} period. It was acquired by the Metropolitan museum in #{artwork["accessionYear"]}"
    new_artwork = Artwork.new(
      title: title,
      creator: creator_name,
      description: description,
      dimensions: dimensions,
      creation_date: creation_date,
      medium: medium,
      price_per_day: rand(2000..20_000)
    )
    new_artwork.user = louvre_admin
    new_artwork.save!
    p new_artwork
    first_image = Image.new(url: primary_image)
    first_image.artwork = new_artwork
    first_image.save
    p first_image
    if artwork["additionalImages"] != []
      artwork["additionalImages"][0...4].each do |image_url|
        new_image = Image.new(url: image_url) unless image_url.nil?
        new_image.artwork = new_artwork
        new_image.save
        p new_image
      end
    end
  end
end

